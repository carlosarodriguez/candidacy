//
//  PollViewStats.swift
//  Candidacy
//
//  Created by Sam Wang on 12/3/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import Foundation
import Parse
import UIKit

class PollViewStats: UIViewController {
    @IBOutlet weak var firstPlaceName: UILabel!
    @IBOutlet weak var secondPlaceName: UILabel!
    @IBOutlet weak var thirdPlaceName: UILabel!
    @IBOutlet weak var firstPlaceVotes: UILabel!
    @IBOutlet weak var secondPlaceVotes: UILabel!
    @IBOutlet weak var thirdPlaceVotes: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var query = PFQuery(className: "Candidate")
        query.orderByDescending("voteCount")
        query.limit = 3
        
        var i:Int = 0
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            for object in objects! {
                if i == 0 {
                    self.firstPlaceName.text = "\(object["firstName"]) \(object["lastName"])"
                    self.firstPlaceVotes.text = String(object["voteCount"])
                } else if i == 1 {
                    self.secondPlaceName.text = "\(object["firstName"]) \(object["lastName"])"
                    self.secondPlaceVotes.text = String(object["voteCount"])
                } else {
                    self.thirdPlaceName.text = "\(object["firstName"]) \(object["lastName"])"
                    self.thirdPlaceVotes.text = String(object["voteCount"])
                }
            }
        }
    }
    
}
