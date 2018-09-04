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

// <T: UITableViewCell> Declare generic, we can change different tableViewCell
class BaseTableViewController<GenericCell: UITableViewCell>: UITableViewController {
    
    
    fileprivate let cellId = "IdCell"
    
    var arrItems : [Any] = [Any]()
    
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
        
       
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BaseCustomCell
        
        let item = arrItems[indexPath.row]
//        cell.textLabel?.text = "\(item)"

        cell.item = item
        
        return cell
        
    }
    
    
    
}

class CustomYellowCell: UITableViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .yellow
    }
    
}


class BaseCustomCell: UITableViewCell {
    
    var item : Any!{
        didSet{
            textLabel?.text = item as? String
        }
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        backgroundColor = .green
//    }
    
}

// <CustomYellowCell> we can set generic tableViewCell
// <model> we can set the numberofrow in generic syntax
class SomeListController: BaseTableViewController<BaseCustomCell> {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // What happent if you want to register diferent tableViewCell
        // Use generic syntax code
        
        // we can overide the property  arrItems but ... we can use generic type
        arrItems = ["Generic", "methods", "types"]
    }
    
}










