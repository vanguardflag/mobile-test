//
//  AnanasBaseController.swift
//  AnanasJob
//
//  Created by Jalal Najafi on 12/9/18.
//  Copyright © 2018 AnanasJob. All rights reserved.
//

import UIKit

class AgriBaseController: UIViewController {
    
    
    
    
    @IBOutlet var containerView: UIView!
    var titleBarViewController: TitleBarViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
// MARK: - Navigation  -
extension AgriBaseController {
    func goToCandidateTabbar() {
//        let candidateTabbar = GlobalConfigurator.createController(controllerType: CandidateTabbarController(), storyboard: "CandidateDashboard", identifier: "CandidateTabbarController")
//        self.present(candidateTabbar, animated: true, completion: nil)
        
    }
    
    func goToCompanyTabbar() {
//        let companyTabbar = GlobalConfigurator.createController(controllerType: CompanyTabbarController(), storyboard: "CompanyDashboard", identifier: "CompanyTabbarController")
//        self.present(companyTabbar, animated: true, completion: nil)
    }
    func goToActivationViewController(mobile: String,isForget: Bool) {
//        let activationViewController = GlobalConfigurator.createController(controllerType: ActivationController(), storyboard: "Registration", identifier: "ActivationController")
//       activationViewController.setContent(mobile: mobile,isForget: isForget)
//        self.navigationController?.pushViewController(activationViewController, animated: true)
    }
}


//****
// MARK: - RTL or LTR -
//****

extension AgriBaseController {
    func changeLng(isRTL : Bool, currentViewController : UIViewController?, lng: String){
        
//        if GlobalVar.shared.lng != lng {
//            GlobalVar.shared.setLng(lng: lng)
//            GlobalVar.shared.setIsRTL(isRTL: isRTL)
//            UIView.appearance().semanticContentAttribute = GlobalVar.shared.isRTL ? .forceRightToLeft : .forceLeftToRight
//            let appDelegate = UIApplication.shared.delegate as? AppDelegate
//            let mainController = GlobalConfigurator.createController(controllerType: CategoryViewController(), storyboard: Storyboards..rawValue, identifier: ViewControllerIdentifier.StartAppVCId.rawValue)
//            appDelegate?.window?.rootViewController = mainController
//            UserDefaults.standard.set([GlobalVar.shared.lng], forKey: "lproj")
//            UserDefaults.standard.synchronize()
//            if currentViewController is MainRegistrationViewController{
//                mainController.goToRegistrationFlow(animated: true)
//            }
//        }
    }
}
//***
// MARK: - swip handled -
//***
extension UIViewController {
    open override func awakeFromNib() {
        super.awakeFromNib()
        navigationController?.view.semanticContentAttribute =  GlobalVar.shared.isRTL ? .forceRightToLeft : .forceLeftToRight
        navigationController?.navigationBar.semanticContentAttribute =  GlobalVar.shared.isRTL ? .forceRightToLeft : .forceLeftToRight
    }
}
extension UIViewController {
    /// show for notifi
    func showAlert(withMessage message: String, title: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "تأیید", style: .default) { (action:UIAlertAction) in
            print("You've pressed default");
        }
        alertController.addAction(action1)
        alertController.popoverPresentationController?.sourceView = self.view // works for both iPhone & iPad
        alertController.view.tintColor = UIColor.agriGreen
        self.present(alertController, animated: true, completion: nil)
    }
}



extension AgriBaseController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "containerViewSegue" {
            titleBarViewController = segue.destination as? TitleBarViewController
   
        }
    }
}
