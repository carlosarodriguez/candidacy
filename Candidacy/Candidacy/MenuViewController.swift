//
//  MenuViewController.swift
//  Candidacy
//
//  Created by Kevin Avila on 10/15/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        var cellIdentifier: String = "menuCell"
//        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
//        cell = UITableViewCell(style: UITableViewCellStyleDefault, reuseIdentifier: cellIdentifier)
//        if indexPath.section == 0 {
//            var titles: [AnyObject] = ["Home", "Profile", "Chats"]
//            cell.textLabel.text = titles[indexPath.row]
//        }
//        else {
//            var titles: [AnyObject] = ["John Appleseed", "John Doe", "Test User"]
//            cell.textLabel.text = titles[indexPath.row]
//        }
//        return cell
//    }
    
}
