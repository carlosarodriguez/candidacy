//
//  CandidateDetailViewController.swift
//  Candidacy
//
//  Created by Kevin Avila on 10/23/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit
import Alamofire
import Parse

class CandidateDetailViewController: UIViewController, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    // This gets set by the presenting view controller
    var candidate:Candidate? = nil
    
    var personalDetails = Dictionary<String, AnyObject>()
    var bio:String = ""
    var politicalPositions = Dictionary<String,[String]>()
    var quotes:[String] = [String]()
    
    var profileSections:[String] = ["Personal Details", "Bio", "Political Positions", "Quotes"]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileWhiteBackground: UIView!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var candidateNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet var headerImageView:UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        // set up profile
        candidateNameLabel.text = candidate!.name
        profileImage.image = candidate?.getPic()
        profileImage.layer.cornerRadius = 0.5 * profileImage.bounds.size.width
        profileWhiteBackground.layer.cornerRadius = 0.5 * profileWhiteBackground.bounds.size.width
        profileImage.clipsToBounds = true
        
        self.navigationController?.navigationBarHidden = true
        
        retrieveProfileInfo()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // Header - Image
        
        headerImageView = UIImageView(frame: header.bounds)
        headerImageView?.image = candidate?.getBanner()
        headerImageView?.contentMode = UIViewContentMode.ScaleAspectFill
        header.insertSubview(headerImageView, aboveSubview: tableView)
        
        header.clipsToBounds = true
    }
    
    func retrieveProfileInfo() {
        let query = PFQuery(className:"Candidate")
        
        query.whereKey("firstName", equalTo: candidate!.firstName)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved our \(objects!.count) candidate.")
                
                // get profile info for candidate
                if let objects = objects as [PFObject]! {
                    for object in objects {
                        self.personalDetails["age"] = object["age"] as! Int
                        self.personalDetails["hometown"] = object["hometown"] as! String
                        self.personalDetails["party"] = object["politicalParty"] as! String
                        self.personalDetails["spouse"] = object["spouse"] as! String
                        self.personalDetails["almamater"] = object["almamater"] as! [String]
                        self.personalDetails["religion"] = object["religion"] as! String
                        
                        self.bio = object["biography"] as! String
                        
                        self.politicalPositions["abortion"] = object["abortion"] as? [String]
                        self.politicalPositions["drugs"] = object["drugs"] as? [String]
                        self.politicalPositions["education"] = object["education"] as? [String]
                        self.politicalPositions["foreignpolicy"] = object["foreignpolicy"] as? [String]
                        self.politicalPositions["healthcare"] = object["healthcare"] as? [String]
                        self.politicalPositions["taxes"] = object["taxes"] as? [String]
                        
                        self.quotes = object["quotes"] as! [String]
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
    }

    // Table View Data Source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileSections.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("profileCell", forIndexPath:indexPath) as UITableViewCell
        cell.textLabel?.text = profileSections[indexPath.row]
        cell.textLabel?.font = UIFont(name: "avenir-medium", size: 16)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.tableView.frame.size.height / 4;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        view.alpha = 0.5
        if (indexPath.row == 0) { // personalDetails
            print(indexPath.row)
            let personalDetailsViewController:PersonalDetailsViewController = self.storyboard!.instantiateViewControllerWithIdentifier("personalDetailsVC") as! PersonalDetailsViewController
            personalDetailsViewController.modalPresentationStyle = .OverCurrentContext
            self.presentViewController(personalDetailsViewController, animated: true, completion: nil)
            
            personalDetailsViewController.delegate = self
            personalDetailsViewController.ageLabel.text = String(personalDetails["age"]!)
            personalDetailsViewController.hometownLabel.text = personalDetails["hometown"] as? String
            personalDetailsViewController.partyLabel.text = personalDetails["party"] as? String
            personalDetailsViewController.spouseLabel.text = personalDetails["spouse"] as? String
            let almamaterArray = personalDetails["almamater"] as! [String]
            let almamaterMultiLineString = almamaterArray.joinWithSeparator("\n")
            personalDetailsViewController.almamaterLabel.text = almamaterMultiLineString
            personalDetailsViewController.almamaterLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
            personalDetailsViewController.almamaterLabel.sizeToFit()
            personalDetailsViewController.religionLabel.text = personalDetails["religion"] as? String
        } else if (indexPath.row == 1) { //bio
            print(indexPath.row)
            let bioViewController:BioViewController = self.storyboard!.instantiateViewControllerWithIdentifier("bioVC") as! BioViewController
            bioViewController.modalPresentationStyle = .OverCurrentContext
            self.presentViewController(bioViewController, animated: true, completion: nil)

            bioViewController.delegate = self
            bioViewController.bioTextView.text = bio
        }
    }

    @IBAction func dismissCandidateProfile(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
