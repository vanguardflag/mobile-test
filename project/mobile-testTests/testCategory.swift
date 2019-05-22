//
//  testCategory.swift
//  mobile-testTests
//
//  Created by Apple on 5/22/19.
//  Copyright © 2019 bki. All rights reserved.
//

import XCTest
@testable import mobile_test

class testCategory: XCTestCase ,ViewModelDelegate{

    var vc : CategoryViewController? = nil
    override func setUp() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//         vc = storyboard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
//
//        viewModel = CategoriesViewModel()
//        viewModel.delegate = self
//
//        self.viewModel.initData()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func willLoadData() {
        
    }
    
    func didLoadData() {
        valueInDataSource()
    }
    
    var Categories: [(Title:String,Data: CategoryModel)] = []
    var viewModel : CategoriesViewModel!

    

    func testInitviews(){
//        let vc = CategoryViewController()
//        _ = vc.view
//        
//        XCTAssertNotNil(vc.categoryTableView)
    
    }
    
   

    func valueInDataSource() {
       
        // expected one section
       // XCTAssertEqual(Categories.map({$0.Title}).count,2)
        
        // expected two cells
       // XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 2, "Expected no cell in table view")
    }
    
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
