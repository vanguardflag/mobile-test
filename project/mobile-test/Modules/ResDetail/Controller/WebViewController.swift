//
//  WebViewController.swift
//  mobile-test
//
//  Created by Apple on 5/22/19.
//  Copyright © 2019 bki. All rights reserved.
//

import UIKit
import WebKit


class WebViewController: KeyboardHandler,WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    var url :String = "www.google.com"
    
   
 

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: url)!))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "" {
            UserDefaults.standard.set("Web", forKey: TITLE_VIEW)
            titleBarViewController?.changeLabel(text: "")
            
            
            return true
        }else{
            if badParameters  {
                // your code here, like badParameters  = false, e.t.c
                navigationController?.navigationBar.isHidden = true
                return false
            }
            return true
        }
    }
}


