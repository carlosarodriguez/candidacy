//
//  BioViewController.swift
//  Candidacy
//
//  Created by Kevin Avila on 12/3/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

class BioViewController: UIViewController {
    
    var delegate:CandidateDetailViewController? = nil
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bioTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        scrollView.layer.borderWidth = 2
        scrollView.layer.borderColor = UIColor.blackColor().CGColor
        view.backgroundColor = UIColor.clearColor()
        bioTextView.font = UIFont(name: "avenir-medium", size: 16)
    }
    
    @IBAction func dismissBio(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
        delegate!.view.alpha = 1.0
    }

}
