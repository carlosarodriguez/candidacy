//
//  CandidatesViewController.swift
//  Candidacy
//
//  Created by Kevin Avila on 10/17/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit
import REFrostedViewController


class CandidatesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showMenu(sender: AnyObject) {
        self.view.endEditing(true)
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.presentMenuViewController()
    }
    
    
}

