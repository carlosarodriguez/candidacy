//
//  QuestionTableViewCell.swift
//  Candidacy
//
//  Created by Carlos Rodriguez on 10/20/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}