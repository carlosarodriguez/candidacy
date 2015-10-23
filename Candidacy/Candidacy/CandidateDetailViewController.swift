//
//  CandidateDetailViewController.swift
//  Candidacy
//
//  Created by Kevin Avila on 10/23/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

class CandidateDetailViewController: UIViewController {
    
    // This gets set by the presenting view controller
    var candidate:Candidate? = nil
    
    @IBOutlet weak var candidateNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the person data.
        // Assumption is it was set to the Person we need to display before this is called.
        candidateNameLabel.text = candidate!.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
