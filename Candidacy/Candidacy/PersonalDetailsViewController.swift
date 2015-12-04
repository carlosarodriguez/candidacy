//
//  PersonalDetailsViewController.swift
//  Candidacy
//
//  Created by Kevin Avila on 12/3/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

class PersonalDetailsViewController: UIViewController {
    
    var delegate:CandidateDetailViewController? = nil
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var spouseLabel: UILabel!
    @IBOutlet weak var almamaterLabel: UILabel!
    @IBOutlet weak var religionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.layer.borderWidth = 2
        scrollView.layer.borderColor = UIColor.blackColor().CGColor
        view.backgroundColor = UIColor.clearColor()
        ageLabel.font = UIFont(name: "avenir-medium", size: 16)
        hometownLabel.font = UIFont(name: "avenir-medium", size: 16)
        partyLabel.font = UIFont(name: "avenir-medium", size: 16)
        spouseLabel.font = UIFont(name: "avenir-medium", size: 16)
        almamaterLabel.font = UIFont(name: "avenir-medium", size: 16)
        religionLabel.font = UIFont(name: "avenir-medium", size: 16)
    }
    

    @IBAction func dismissPersonalDetails(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
        delegate!.view.alpha = 1.0
    }
    
}
