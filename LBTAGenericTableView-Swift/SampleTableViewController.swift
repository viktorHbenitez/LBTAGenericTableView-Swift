//
//  SampleTableViewController.swift
//  LBTAGenericTableView-Swift
//
//  Created by Victor Hugo Benitez Bosques on 03/09/18.
//  Copyright © 2018 Victor Hugo Benitez Bosques. All rights reserved.
//

import Foundation
import UIKit
/*
 
 Generic programming is a way to write function and data types while making minimal assumptions (suposiciones minimas) about the type of data being used
 
    Generic can be used to reduce functions to redundant code
 */

// BaseCustomCell use <GenericTypeModel> with it is an object
class BaseTableViewController<GenericCell: BaseCustomCell<GenericTypeModel>, GenericTypeModel>: UITableViewController {
    
    
    fileprivate let cellId = "IdCell"
    
    var arrItems : [GenericTypeModel] = [GenericTypeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    
    
    fileprivate func setupTableView(){
        
        //        tableView.tableFooterView  = UIView() // Remove horizontal lines
        tableView.register(GenericCell.self, forCellReuseIdentifier: cellId)
        
        
    }
    // Number of section in table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Number of row in table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrItems.count
    }
    
    
    // Create a cell for each table view row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BaseCustomCell<GenericTypeModel>
        
//        let item = arrItems[indexPath.row]
//        cell.textLabel?.text = "\(item)"

        cell.item = arrItems[indexPath.row]
        
        return cell
        
    }
    
    
    
}



struct Model {
    let strName : String?
}


// Base TableViewCell use a generic object
class BaseCustomCell<GenericModel>: UITableViewCell {
    
    var item : GenericModel!
    
}
// Custom set the model we need to use
class CustomCell: BaseCustomCell<Model> {
    override var item: Model!{
        didSet{
            textLabel?.text = item.strName
        }
    }
    
}


// <CustomYellowCell> we can set generic tableViewCell
// <model> we can set the numberofrow in generic syntax
class SomeListController: BaseTableViewController<CustomCell, Model> {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // What happent if you want to register diferent tableViewCell
        // Use generic syntax code
        
        // we can overide the property  arrItems but ... we can use generic type
        arrItems = [
            Model(strName: "Primera person"),
            Model(strName: "Segunda person")
        ]
    }
    
}










