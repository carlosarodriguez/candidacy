//
//  PollViewController.swift
//  Candidacy
//
//  Created by Kevin Avila on 11/22/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

class PollViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func showMenu(sender: AnyObject) {
        self.view.endEditing(true)
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.presentMenuViewController()
    }
}
