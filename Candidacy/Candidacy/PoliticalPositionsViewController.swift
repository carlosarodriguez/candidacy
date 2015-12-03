//
//  PoliticalPositionsViewController.swift
//  Candidacy
//
//  Created by Kevin Avila on 12/3/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

class PoliticalPositionsViewController: UIViewController {
    
    var delegate:CandidateDetailViewController? = nil
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var abortionLabel: UILabel!
    @IBOutlet weak var drugsLabel: UILabel!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var fpLabel: UILabel!
    @IBOutlet weak var healthcareLabel: UILabel!
    @IBOutlet weak var taxesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        scrollView.layer.borderWidth = 2
        scrollView.layer.borderColor = UIColor.blackColor().CGColor
        view.backgroundColor = UIColor.clearColor()
    }
    
    @IBAction func dismissPoliticalPositions(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
        delegate!.view.alpha = 1.0
    }
}
