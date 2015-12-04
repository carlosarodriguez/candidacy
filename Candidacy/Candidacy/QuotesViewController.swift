//
//  QuotesViewController.swift
//  Candidacy
//
//  Created by Kevin Avila on 12/3/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {
    
    var delegate:CandidateDetailViewController? = nil
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var quote1: UILabel!
    @IBOutlet weak var quote2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.layer.borderWidth = 2
        scrollView.layer.borderColor = UIColor.blackColor().CGColor
        view.backgroundColor = UIColor.clearColor()
    }
    
    @IBAction func dismissQuotes(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
        delegate!.view.alpha = 1.0
    }
}
