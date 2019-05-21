//
//  SocialMediaInfoTableViewCell.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//

import UIKit

class SocialMediaInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var btnFaceBook: UIButton!
    @IBOutlet weak var btnTwitter: UIButton!
    @IBOutlet weak var btnYouTube: UIButton!
    var facebook:String = ""
    var twitter:String = ""
    var youtube:String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(facebook:String,twitter:String,youtube:String) {
        self.facebook = facebook
        self.twitter = twitter
        self.youtube = youtube
    }
    
    @IBAction func goFaceBook(_ sender: Any) {
        GoToURL.openWebsite(urlAddress: facebook)
    }
    @IBAction func twitter(_ sender: Any) {
        GoToURL.openWebsite(urlAddress: twitter)

    }
    @IBAction func goYoutub(_ sender: Any) {
        GoToURL.openWebsite(urlAddress: youtube)

    }
    
    
}
