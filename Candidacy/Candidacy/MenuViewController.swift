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
    
    let menuItems:[String] = ["News","Candidates","GoVote","Poll"]
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self;
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
    
    override func tableView(tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("menuCell", forIndexPath: indexPath)
        
        // Configure the cell...
        let index:Int = indexPath.row
        
        // textLabel and text are both optionals, so, need to unwrap them
        cell.textLabel!.text! = menuItems[index]
        
        return cell
    }
    
    // MARK: - Navigation
    
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showNews" {
//            
//            //let indexPath:NSIndexPath? = self.tableView!.indexPathForSelectedRow
//            
//            // Get the destination view controller
//            let newsVC:NewsViewController = segue.destinationViewController as! NewsViewController
//            
//            // Pass in the data model for the row selected
//            // detailVC.person = self.data.getPerson(index: indexPath!.row)
//        } else if segue.identifier == "showCandidates" {
//            // Get the destination view controller
//            let newsVC:CandidatesViewController = segue.destinationViewController as! CandidatesViewController
//        }
//    }
    
}
