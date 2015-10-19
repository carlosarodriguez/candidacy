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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let navigationController: NavigationController = self.storyboard!.instantiateViewControllerWithIdentifier("navController") as! NavigationController
        
        if indexPath.row == 0 { // News Page
            let newsViewController: NewsViewController = self.storyboard!.instantiateViewControllerWithIdentifier("newsController") as! NewsViewController
            navigationController.viewControllers = [newsViewController]
        } else if indexPath.row == 1 { // Candidates Page
            let candidatesViewController: CandidatesViewController = self.storyboard!.instantiateViewControllerWithIdentifier("candidatesController") as! CandidatesViewController
            navigationController.viewControllers = [candidatesViewController]
        }
        
        self.frostedViewController.contentViewController = navigationController
        self.frostedViewController.hideMenuViewController()
    }
    
}
