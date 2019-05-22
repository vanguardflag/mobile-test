//
//  ResourcesViewController.swift
//  mobile-test
//
//  Created by Apple on 5/20/19.
//  Copyright © 2019 bki. All rights reserved.
//

import UIKit

class ResInfoViewController: KeyboardHandler,onSortingDelegate {
    var titleLabel: String = "Res Info"
    var selectItems:String = ResInfo.restaurants.rawValue
    @IBOutlet weak var resInfoTableView: UITableView!{
        didSet{
            resInfoTableView.register(UINib(nibName: "ResInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "ResInfoTableViewCell")
            
            resInfoTableView.delegate = self
            resInfoTableView.dataSource = self
        }
    }
    var kindSort:Bool = true
    private var vModel: ResInfoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vModel = ResInfoViewModel()
        vModel.delegate = self
        vModel.initData()
        vModel.getData(selectedItem: selectItems)
        titleBarViewController?.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UserDefaults.standard.set(titleLabel, forKey: TITLE_VIEW)
        titleBarViewController?.changeLabel(text: "")
        (children.first as? TitleBarViewController)?.isSorting()
        (children.first as? TitleBarViewController)?.delegate = self
        
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



extension ResInfoViewController: ViewModelDelegate {
    
    func willLoadData() {
        //activityIndicator?.startAnimating()
        resInfoTableView.showLoading()
    }
    
    func didLoadData() {
        resInfoTableView.reloadData()
        resInfoTableView?.hideLoading()
    }
    
}


extension ResInfoViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vModel.ResInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResInfoTableViewCell", for: indexPath) as? ResInfoTableViewCell
        let Res = vModel.ResInfoList[indexPath.row]
        cell?.fillData(img: Res.photo!, title: Res.title, subTitle: Res.description)
        return cell!
    }
    
    
    
    
}


extension ResInfoViewController:UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        badParameters = false
        let cell = self.resInfoTableView.cellForRow(at: indexPath)
        cell?.setSelected(false, animated: true)
        self.performSegue(withIdentifier: "ResDetialsSegueIdentifier", sender: vModel.ResInfoList[indexPath.row])
    }
    
}


extension ResInfoViewController{
    
    func doSorting() {
        vModel.doSorting(kindSort: kindSort)
        kindSort = !kindSort
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResDetialsSegueIdentifier" {
            let resInfoExtera = sender as? ResInfoModel
            if let dest = segue.destination  as? ResDetailViewController {
                dest.vModel.ResDetail = resInfoExtera!
                UserDefaults.standard.set("Detail Information", forKey: TITLE_VIEW)
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
