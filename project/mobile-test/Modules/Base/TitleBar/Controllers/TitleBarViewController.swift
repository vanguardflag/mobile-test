//
//  TitleBarViewController.swift
//  agriBank
//
//  Created by Apple on 4/23/19.
//  Copyright © 2019 bki. All rights reserved.
//

import UIKit

protocol onSortingDelegate: class {
    func doSorting()
}


class TitleBarViewController: UIViewController {
    
    @IBOutlet weak var btnSorting: UIButton!
    @IBOutlet weak var titles: UILabel!
    var titleValue:String = ""
   // var delegate : TitleBarVC
    @IBOutlet weak var btnBack: UIButton!
    weak var delegate:onSortingDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        changeLabel(text: "")
        //changeLabel(text: titleValue)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doBack(_ sender: Any) {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    func isHome() {
        btnBack.isHidden = true
    }
    
    func isSorting() {
        btnSorting.isHidden = false
    }
    
    func changeLabel(text: String) {
        if text == ""{
            titles.text = UserDefaults.standard.string(forKey: TITLE_VIEW)!

        }else{
            titles.text = text
        }
    }
    
    
    @IBAction func doSort(_ sender: Any) {
        self.delegate!.doSorting()
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
