//
//  NetworkFoundation.swift
//
//
//  Created by Jalal Najafi.
//  Copyright © 2018  . All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
import Reachability

protocol NetworkUtilities {
    func get(fromURL: String,
             parameters: Parameters?) -> Promise<Data>
    func post(toURL: String?,
              parameters: Parameters?) -> Promise<Data>
    func put(toURL: String,
             parameters: Parameters?) -> Promise<Data>
    func delete(fromURL: String,
                parameters: Parameters?) -> Promise<Data>
    func uploadFile(toURL url: String,
                    file: Data,
                    name: String,
                    extention: String,
                    mimeType: String,
                    parameters: Parameters?) -> Promise<Data>
    func deleteWithUrlParameters(fromURL url: String, parameters: Parameters?) -> Promise<Data>
    func getNewTransactionId()->CUnsignedLongLong 
}
class  HttpGateway: NetworkConfiguration, NetworkUtilities {
    
    
 
    
    func get(fromURL url: String, parameters: Parameters?) -> Promise<Data> {
        guard NetworkReachabilityManager()?.isReachable ?? false else {
            return Promise(error: Errors.Remote.noNetworkConnectivity)
        }
        
        let url = baseUrl + url
        return session.request(url,
                               method: .get,
                               parameters: parameters?.dictionary,
                               encoding: URLEncoding.default,
                               headers: header)
            .validate(validate(_:_:_:))
            .responseData()
    }
    
    func post(toURL url: String?, parameters: Parameters?) -> Promise<Data> {
        guard NetworkReachabilityManager()?.isReachable ?? false else {
            return Promise(error: Errors.Remote.noNetworkConnectivity)
        }
        let url = baseUrl + url!
  
  
        return session.request(url,
                               method: .post,
                               parameters: parameters?.dictionary,
                               encoding: JSONEncoding.default,
                               headers: header)
            .validate(validate(_:_:_:))
            .responseData()
       

    }
    func postWithUrlParameters(toURL url: String, parameters: Parameters?) -> Promise<Data> {
        guard NetworkReachabilityManager()?.isReachable ?? false else {
            return Promise(error: Errors.Remote.noNetworkConnectivity)
        }
        let url = baseUrl + url
        return session.request(url,
                               method: .post,
                               parameters: parameters?.dictionary,
                               encoding: URLEncoding(destination: .queryString),
                               headers: header)
            .validate(validate(_:_:_:))
            .responseData()
        
    }
    
    func put(toURL url: String, parameters: Parameters?) -> Promise<Data> {
        guard NetworkReachabilityManager()?.isReachable ?? false else {
            return Promise(error: Errors.Remote.noNetworkConnectivity)
        }
        let url = baseUrl + url
        return session.request(url,
                               method: .put,
                               parameters: parameters?.dictionary,
                               encoding: JSONEncoding.default,
                               headers: header)
            .validate(validate(_:_:_:))
            .responseData()
    }
    func putWithUrlParameters(toURL url: String, parameters: Parameters?) -> Promise<Data> {
        guard NetworkReachabilityManager()?.isReachable ?? false else {
            return Promise(error: Errors.Remote.noNetworkConnectivity)
        }
        let url = baseUrl + url
        return session.request(url,
                               method: .put,
                               parameters: parameters?.dictionary,
                               encoding: URLEncoding(destination: .queryString),
                               headers: header)
            .validate(validate(_:_:_:))
            .responseData()
    }
    
    func delete(fromURL url: String, parameters: Parameters?) -> Promise<Data> {
        guard NetworkReachabilityManager()?.isReachable ?? false else {
            return Promise(error: Errors.Remote.noNetworkConnectivity)
        }
        let url = baseUrl + url
        return session.request(url,
                               method: .delete,
                               parameters: parameters?.dictionary,
                               encoding: JSONEncoding.default,
                               headers: header)
            .validate(validate(_:_:_:))
            .responseData()
    }
    func deleteWithUrlParameters(fromURL url: String, parameters: Parameters?) -> Promise<Data> {
        guard NetworkReachabilityManager()?.isReachable ?? false else {
            return Promise(error: Errors.Remote.noNetworkConnectivity)
        }
        let url = baseUrl + url
        return session.request(url,
                               method: .delete,
                               parameters: parameters?.dictionary,
                               encoding: URLEncoding(destination: .queryString),
                               headers: header)
            .validate(validate(_:_:_:))
            .responseData()
    }
    func uploadFile(toURL url: String, file: Data, name: String, extention: String, mimeType: String, parameters: Parameters?) -> Promise<Data> {
        guard NetworkReachabilityManager()?.isReachable ?? false else {
            return Promise(error: Errors.Remote.noNetworkConnectivity)
        }
        let url = baseUrl + url
        return Promise { (resolve, rejct) in
            session
                .upload(multipartFormData: { multipartFormData in
                    multipartFormData.append(file,
                                             withName: name,
                                             fileName: name + extention,
                                             mimeType: mimeType)
                    if let parameter = parameters {
                    for (key, value) in parameter.dictionary {
                        multipartFormData.append(String(describing: value).data(using: .utf8)!, withName: key)
                        }
                        
                    }
                },
                        to: url,
                        method: .post,
                        headers: header,
                        encodingCompletion: { (result) in
                            switch result {
                            case .success(let upload, _, _):
                                upload
                                    .validate(self.validate(_:_:_:))
                                    .responseData { (response) in
                                        switch response.result {
                                        case .success(let data):
                                            resolve(data)
                                        case .failure(let error):
                                            rejct(error)
                                        }
                                }
                            case .failure(let error):
                                rejct(error)
                            }
                })
        }
    }
    
    
    func getNewTransactionId()->CUnsignedLongLong {
        if var newTransactionId = UserDefaults.standard.value(forKey: UserDefaultList.CurrentTransactionId.rawValue) as? CLongLong {
            newTransactionId = newTransactionId+1
            UserDefaults.standard.setValue(newTransactionId, forKey: UserDefaultList.CurrentTransactionId.rawValue)
            print(newTransactionId)
            return CUnsignedLongLong(newTransactionId)
            
        }
        UserDefaults.standard.setValue(1000, forKey: UserDefaultList.CurrentTransactionId.rawValue)
        return 1000
    }
    
    
}

class NetworkConfiguration {
    lazy var computedBaseURL: String = {
        let stringURL = "https://raw.githubusercontent.com/quickseries/mobile-test/master/data/"
        return stringURL
    }()
    var baseUrl: String {
        return computedBaseURL
    }
    var token: String? {
        return UserDefaultsService.shared.getToken()
    }
    var header: HTTPHeaders? {
        var result: HTTPHeaders? = [
            "Content-Type": "text/plain"
        ]
        if let token = token {
            result?.updateValue(token, forKey: "Authorization")
        }
        result?.updateValue("B2B", forKey: "app-type")
        result?.updateValue("IOS", forKey: "os-type")
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            result?.updateValue(version, forKey: "app-version")
        }
        return result
    }
    lazy var session: SessionManager = {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 60
        let session = SessionManager(configuration: sessionConfig)
        return session
    }()
    func validate(_ request: URLRequest?, _ response: HTTPURLResponse, _ data: Data?) -> Request.ValidationResult {
        
        switch response.statusCode {
        case 400:
            return .failure(Errors.Remote.badRequest(data: data))
        case 401:
            // remove token and show authentication page
            UserDefaultsService.shared.removeToken()
            DispatchQueue.main.async {
                if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                    let root = UIStoryboard(name: "Intro", bundle: Bundle.main).instantiateInitialViewController()
                    let newWindow = UIWindow()
//                    appDelegate.replaceWindow(newWindow)
                    newWindow.rootViewController = root
                    debugPrint(appDelegate)
                }
            }
            return .failure(Errors.Remote.unAuthorized(data: data))
        case 403:
            return .failure(Errors.Remote.forbiden)
        case 404:
            return .failure(Errors.Remote.notFound(data: data))
        case 400..<500:
            return .failure(Errors.Remote.serverUnAvailable)
        case 503:
            return .failure(Errors.Remote.maintenance)
        case 504:
            return .failure(Errors.Remote.serverUnAvailable)
        case 500 ..< 600:
            return .failure(Errors.Remote.notFound(data: data))
        default:
            return .success
        }

    }
}

extension HttpGateway{

func getStatusMessage(state: Int) -> String {
    var result = ""
    switch state
    {
    case 0           :  result = "موفق"
    case 1...99999   : result = " خطای در تراکنش عملیاتی"
    case 1002102     :  result = "خطا در سرور بانک"
    case 1002101     : result = "خطا در اتصال به سرور بانک"
    case 1001702     :  result = "بدلیل گذشت زمان، امکان بازیابی تراکنش وجود ندارد"
    case 1001701     :  result = "تراکنش یافت نشد"
    case 1001611     :  result = "مبلغ در محدوده مجاز نمی باشد"
    case 1001603     :  result = "خطا در دریافت لیست حساب ها یا کارت ها"
    case 1001602     :  result = "حساب یا کارت غیرفعال شده است"
    case 1001601     :  result = "شماره حساب یا کارت معتبر نیست"
    case 1001505     :  result = "رمز فعال سازی صحیح نمی باشد "
    case 1001504     :  result = "حساب کاربری غیرفعال شده است"
    case 1001503     :  result = "تعداد رمزهای غلط بیشتر از حد مجاز است"
    case 1001502     :  result = "نشست معتبر نیست"
    case 1001501     :  result = "نام کاربری یا رمز عبور صحیح نیست"
    case 1001403     :  result = "برنامه نیاز به تایید هویت مجدد کاربر دارد"
    case 1001402     :  result = "رمز ورود انتخاب شده توسط کاربر قابل قبول نیست"
    case 1001401     :  result = "موبایل قبلا فعال شده است"
    case 1001303     :  result = "زمان لازم برای ارسال مجدد کد فعال سازی گذشته است"
    case 1001302     :  result = "نیاز به ارسال مجدد کد فعال سازی موبایل (در صورت غلط بودن رمز یا تایم اوت شدن کد فعال سازی)"
    case 1001301     :  result = "کد فعال سازی ارسالی صحیح نیست"
    case 1001203     :  result = "نسخه برنامه قدیمی بوده و به روزرسانی آن الزامی نیست"
    case 1001202     :  result = "the State Application is Worm"
    case 1001201     :  result = "برنامه غیر فعال شده است"
    case 1001103     :  result = "نیاز به تایید شماره موبایل وجود دارد"
    case 1001102     :  result = "موبایل غیرفعال شده است"
    case 1001101     :  result = "موبایل یافت نشد"
    case 1000301     :  result = "Call ID of Notification not Found "
    case 1000202     :  result = "کمبود منابع پردازشی بر روی سرور (کمی بعد سعی کنید)"
    case 1000201     :  result = "خطای نا مشخص"
    case 1000200     :  result = "خطای داخلی سرور"
    case 1000104     :  result = "زمان نگهداری سرور"
    case 1000103     :  result = "زمان ارسالی درخواست با زمان سرورهمگام نیست"
    case 1000102     :  result = "درخواست نامعتبرمی باشد"
    case 1000101     :  result = "نتیجه تراکنش نامشخص می باشد"
        
    default :  result = " خطای در تراکنش عملیاتی"
    }
    
    return result
}
}
