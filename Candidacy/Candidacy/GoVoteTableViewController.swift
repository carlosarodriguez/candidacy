//
//  GoVoteTableViewController.swift
//  Candidacy
//
//  Created by Carlos Rodriguez on 10/19/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

class GoVoteTableViewController: UITableViewController {
    
    var questions = ["How Do I Register to Vote?", "Am I Eligible to Vote?", "What is Absentee Voting?", "How Do I Vote Early?", "How Do I Find My Polling Place?", "How Do I Replace My Voter Registration Card?"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> QuestionTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("faqCell", forIndexPath:indexPath) as! QuestionTableViewCell
        cell.titleLabel.text = questions[indexPath.row]
        cell.titleLabel.font = UIFont(name: "avenir-medium", size: 16)
        return cell
    }
    
    @IBAction func showMenu(sender: AnyObject) {
        self.view.endEditing(true)
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.presentMenuViewController()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = self.tableView.indexPathForCell(sender as! QuestionTableViewCell)
        if let destinationViewController = segue.destinationViewController as? QuestionViewController {
            destinationViewController.question = questions[cell!.row]
            destinationViewController.answer = destinationViewController.answers[cell!.row]
        }
    }
}