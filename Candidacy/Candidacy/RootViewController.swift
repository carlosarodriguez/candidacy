//
//  RootViewController.swift
//  Candidacy
//
//  Created by Kevin Avila on 10/15/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import Foundation
import REFrostedViewController

class RootViewController: REFrostedViewController {
    
    override func awakeFromNib() {
        self.contentViewController = self.storyboard!.instantiateViewControllerWithIdentifier("navController")
        self.menuViewController = self.storyboard!.instantiateViewControllerWithIdentifier("menuController")
    }
    
}