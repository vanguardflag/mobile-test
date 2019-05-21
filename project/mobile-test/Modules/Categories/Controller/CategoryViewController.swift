//
//  CategoryViewController.swift
//  mobile-test
//
//  Created by Apple on 5/18/19.
//  Copyright © 2019 bki. All rights reserved.
//

import UIKit

class CategoryViewController: KeyboardHandler {

    var titleLabel: String = "Category"

    @IBOutlet weak var categoryTableView: UITableView!{
        didSet{
            categoryTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
          
            categoryTableView.delegate = self
            categoryTableView.dataSource = self
        }
    }
    private var vModel: CategoriesViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        vModel = CategoriesViewModel()
        vModel.delegate = self
        vModel.initData()
        //model.initData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UserDefaults.standard.set(titleLabel, forKey: TITLE_VIEW)
        titleBarViewController?.changeLabel(text: "")
        titleBarViewController?.isHome()
        
        
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


extension CategoryViewController: ViewModelDelegate {
    
    func willLoadData() {
        categoryTableView.showLoading()
    }
    
    func didLoadData() {
        categoryTableView.reloadData()
        categoryTableView?.hideLoading()
    }
    
}


extension CategoryViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vModel.Categories.map({$0.Title}).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell
        let cat = vModel.Categories[indexPath.row].Data
        cell?.fillData(title: cat.title, subTitle: cat.description)
        return cell!
    }
    
    
    
    
}


extension CategoryViewController:UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        badParameters = false
        let cell = self.categoryTableView.cellForRow(at: indexPath)
        cell?.setSelected(false, animated: true)
        self.performSegue(withIdentifier: "ResVCSegue", sender: vModel.Categories[indexPath.row].Title)
        
    }
}



extension CategoryViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResVCSegue" {
            let resInfoExtera = sender as? String
            if let dest = segue.destination  as? ResInfoViewController {
                dest.selectItems = resInfoExtera!
            }
        }
    }
        
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "" {
            UserDefaults.standard.set(titleLabel, forKey: TITLE_VIEW)
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
