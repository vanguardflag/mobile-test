//
//  ResDetailViewController.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//

import UIKit

class ResDetailViewController: KeyboardHandler {
    var titlePage: String = "Detail Information"
    var Header :[String] = ["CONTACT INFO"
        , "ADDRESSES"
        , "NOTES"
        , "SOCIAL MEDIA"
        ,"BUSINESS HOURS"]
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lbldescription: UITextView!
    @IBOutlet weak var imgDetial: UIImageView!
    @IBOutlet weak var detailTableView: UITableView!{
        didSet{
            detailTableView.register(UINib.init(nibName: "ContactInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactInfoTableViewCell")
            detailTableView.register(UINib.init(nibName: "AddressTableViewCell", bundle: nil), forCellReuseIdentifier: "AddressTableViewCell")
            detailTableView.register(UINib.init(nibName: "NoteTableViewCell", bundle: nil), forCellReuseIdentifier: "NoteTableViewCell")
            detailTableView.register(UINib.init(nibName: "SocialMediaInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "SocialMediaInfoTableViewCell")
            detailTableView.register(UINib.init(nibName: "BusniessHoursTableViewCell", bundle: nil), forCellReuseIdentifier: "BusniessHoursTableViewCell")
            detailTableView.delegate = self
            detailTableView.dataSource = self
        }
    }
    var vModel: ResDetailViewModel! = ResDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = vModel.ResDetail.title
        lbldescription.text = String(vModel.ResDetail.description).removeHTMLTags
        imgDetial.sd_setImage(with: URL(string: vModel.ResDetail.photo ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UserDefaults.standard.set(titlePage, forKey: TITLE_VIEW)
        titleBarViewController?.changeLabel(text: "")
        titleBarViewController?.isSorting()
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ResDetailViewController:UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    
}

extension ResDetailViewController:UITableViewDataSource{
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 5
        case 1:
            return vModel.ResDetail.addresses?.count ?? 0
        case 4:
            return 7
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return Header[section]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {

        case 0:
            return fillContactInfo(tableView, for: indexPath)
        case 1:
            return fillAddress(tableView, for: indexPath)
        case 2:
            return fillNotes(tableView, for: indexPath)
        case 3:
            return fillSocialMedia(tableView, for: indexPath)
        case 4:
            return fillBussinesHouse(tableView, for: indexPath)
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        
        case 0:
            return 75
        case 1:
            return 150
        case 2:
            return 100
        case 3:
            return 45
        case 4:
            return 45
        default:
            return 50
        }
    }
    
    func fillContactInfo(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactInfoTableViewCell", for: indexPath) as! ContactInfoTableViewCell
        if let modelOk = vModel.ResDetail{
            if let contactInfo = vModel.ResDetail.contactInfo{
                switch indexPath.row {
                case 0:
                    if let phone = contactInfo.phoneNumber{
                        cell.updateUI(title: "PHONE NUMBER", subTitle: "phone", value: phone[0], emailVisibility: true, webVisibility: true, callVisibility: false, smsVisibility: false)
                    }else{
                        cell.updateUI(title: "PHONE NUMBER", subTitle: "", value: "", emailVisibility: true, webVisibility: true, callVisibility: true, smsVisibility: true)
                    }

                case 1:
                    if let TollFree = contactInfo.tollFree{
                        cell.updateUI(title: "TOLL-FREE NUMBER", subTitle: "TollFree", value: TollFree[0], emailVisibility: true, webVisibility: true, callVisibility: false, smsVisibility: false)
                    }else{
                        
                        cell.updateUI(title: "TOLL-FREE NUMBER", subTitle: "", value: "", emailVisibility: true, webVisibility: true, callVisibility: true, smsVisibility: true)
                    }
                case 2:
                    if let fax = contactInfo.faxNumber{
                        cell.updateUI(title: "FAX NUMBER", subTitle: "Fax", value: fax[0], emailVisibility: true, webVisibility: true, callVisibility: true, smsVisibility: true)
                    }else{
                        cell.updateUI(title: "FAX NUMBER", subTitle: "", value: "", emailVisibility: true, webVisibility: true, callVisibility: true, smsVisibility: true)
                    }
                case 3:
                    if let email = contactInfo.email{
                         cell.updateUI(title: "EMAIL ADDRESS", subTitle: "Email", value: email[0], emailVisibility: false, webVisibility: true, callVisibility: true, smsVisibility: true)
                    }else{
                        cell.updateUI(title: "", subTitle: "", value: "", emailVisibility: true, webVisibility: true, callVisibility: true, smsVisibility: true)
                    }
                case 4:
                    if let web = contactInfo.website{
                        cell.updateUI(title: "WEBSITE", subTitle: "Web", value: web[0], emailVisibility: true, webVisibility: false, callVisibility: true, smsVisibility: true)
                    }else{
                        cell.updateUI(title: "WEBSITE", subTitle: "", value: "", emailVisibility: true, webVisibility: true, callVisibility: true, smsVisibility: true)
                    }
                default:
                    cell.updateUI(title: "No Information", subTitle: "", value: "", emailVisibility: true, webVisibility: true, callVisibility: true, smsVisibility: true)
                }
            }else{
                cell.updateUI(title: "No Information", subTitle: "", value: "", emailVisibility: true, webVisibility: true, callVisibility: true, smsVisibility: true)
            }
        }else{
            cell.updateUI(title: "No Information", subTitle: "", value: "", emailVisibility: true, webVisibility: true, callVisibility: true, smsVisibility: true)
        }
        

        return cell
    }
    
    
    
    func fillAddress(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as! AddressTableViewCell
        
        
        if let addressModel = vModel.ResDetail.addresses{
            if addressModel[0]?.label != nil{
                cell.updateUI(Address: addressModel[0], mapVisibility: false)
            }else{
                cell.updateUI(Address:nil, mapVisibility: true)
            }
        }else{
            cell.updateUI(Address:nil, mapVisibility: true)
        }
        
      
        return cell
    }
    
    func fillNotes(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as! NoteTableViewCell
        
        return cell
    }
    
    func fillSocialMedia(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SocialMediaInfoTableViewCell", for: indexPath) as! SocialMediaInfoTableViewCell
        
        if let socialMedia = vModel.ResDetail.socialMedia{
                cell.updateUI(facebook: socialMedia.facebook?[0] ?? "", twitter: socialMedia.twitter?[0] ?? "", youtube: socialMedia.youtubeChannel?[0] ?? "")
        }else{
            cell.updateUI(facebook: "", twitter: "", youtube: "")
        }
        
        return cell
    }
    
    
    func fillBussinesHouse(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusniessHoursTableViewCell", for: indexPath) as! BusniessHoursTableViewCell
        
        switch indexPath.row {
        case 0:
            
            if let from = vModel.ResDetail.bizHours?.sunday?.from, let to = vModel.ResDetail.bizHours?.sunday?.to {
                cell.updateUI(title: DaysOfWeek.sunday.rawValue, detial: from + " - "  + to)
            }
            else {
                cell.updateUI(title: DaysOfWeek.sunday.rawValue, detial: nil)
            }
        case 1:
            if let from = vModel.ResDetail.bizHours?.monday?.from, let to = vModel.ResDetail.bizHours?.sunday?.to {
                cell.updateUI(title: DaysOfWeek.monday.rawValue, detial: from + " - "  + to)
            }
            else {
                cell.updateUI(title:  DaysOfWeek.monday.rawValue, detial: nil)
            }
        case 2:
            if let from = vModel.ResDetail.bizHours?.tuesday?.from, let to = vModel.ResDetail.bizHours?.sunday?.to {
                cell.updateUI(title:  DaysOfWeek.tuesday.rawValue, detial: from + " - "  + to)
            }
            else {
                cell.updateUI(title:  DaysOfWeek.tuesday.rawValue, detial: nil)
            }
        case 3:
            if let from = vModel.ResDetail.bizHours?.wednesday?.from, let to = vModel.ResDetail.bizHours?.sunday?.to {
                cell.updateUI(title:  DaysOfWeek.wednesday.rawValue, detial: from + " - "  + to)
            }
            else {
                cell.updateUI(title:  DaysOfWeek.wednesday.rawValue, detial: nil)
            }
        case 4:
            if let from = vModel.ResDetail.bizHours?.thursday?.from, let to = vModel.ResDetail.bizHours?.sunday?.to {
                cell.updateUI(title:  DaysOfWeek.thursday.rawValue, detial: from + " - "  + to)
            }
            else {
                cell.updateUI(title:  DaysOfWeek.thursday.rawValue, detial: nil)
            }
        case 5:
            if let from = vModel.ResDetail.bizHours?.friday?.from, let to = vModel.ResDetail.bizHours?.sunday?.to {
                cell.updateUI(title:  DaysOfWeek.friday.rawValue, detial: from + " - "  + to)
            }
            else {
                cell.updateUI(title:  DaysOfWeek.friday.rawValue, detial: nil)
            }
        case 6:
            if let from = vModel.ResDetail.bizHours?.saturday?.from, let to = vModel.ResDetail.bizHours?.sunday?.to {
                cell.updateUI(title:  DaysOfWeek.saturday.rawValue, detial: from + " - "  + to)
            }
            else {
                cell.updateUI(title:  DaysOfWeek.saturday.rawValue, detial: nil)
            }
        default:
            break
        }
        
        return cell
    }
}




