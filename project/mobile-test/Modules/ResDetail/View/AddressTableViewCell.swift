//
//  AddressTableViewCell.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//

import UIKit

class AddressTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UITitleLabel!
    @IBOutlet weak var markMap: UIButton!
    @IBOutlet weak var slblStreet: UILabel!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    var lat:String = ""
    var lng:String = ""
    var address = AddressResponse()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(Address:AddressResponse?,mapVisibility:Bool) {
        if let address = Address{
            self.address = address
            self.title.text = "Address" + " " + address.label!
            slblStreet.text = address.address1
            self.lblState.text = address.city! + ", " + address.state! + ", " + address.zipCode!
            self.lblCountry.text = address.country
            if let lats = address.gps?.latitude{
                self.lat = lats
            }
            if let lngs = address.gps?.longitude{
                self.lng = lngs
            }
            self.markMap.isHidden = mapVisibility
        }else{
            self.title.text = "Address"
            slblStreet.text = ""
            self.lblState.text = ""
            self.lblCountry.text = ""
            self.lat = ""
            self.lng = ""
            self.markMap.isHidden = mapVisibility
        }
    }
    
    @IBAction func goToLocation(_ sender: Any) {
        if lat != "" && lng != "" {
            GoToURL.openMapsBaseLatLng(lat: lat, lng: lng)
        }else{
           
            GoToURL.openWebsite(urlAddress: slblStreet.text! + lblState.text! + lblCountry.text!)
        }
    }
    
    
}
