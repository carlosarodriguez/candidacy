//
//  CandidatesDataModel.swift
//  Candidacy
//
//  Created by Kevin Avila on 10/18/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import Foundation
import UIKit

class CandidatesDataModel {
    
    private var candidates:[Candidate] = [Candidate]()
    
    init() {
        // Populate candidates array
        candidates.append(Candidate(name: "Lincoln Chafee", party: "Democratic", pic: UIImage(named: "Lincoln_Chafee_official_portrait_(cropped)-2.jpg")!))
        candidates.append(Candidate(name: "Hillary Clinton", party: "Democratic", pic: UIImage(named: "HRC_in_Iowa_APR_2015.jpg")!))
        candidates.append(Candidate(name: "Lawrence Lessig", party: "Democratic", pic: UIImage(named: "Lessig_(cropped).png")!))
        candidates.append(Candidate(name: "Martin O'Malley", party: "Democratic", pic: UIImage(named: "Governor_O'Malley_Portrait_(cropped).jpg")!))
        candidates.append(Candidate(name: "Bernie Sanders", party: "Democratic", pic: UIImage(named: "Bernie_Sanders_New_Orleans_rally_crop.jpg")!))
        candidates.append(Candidate(name: "Jim Webb", party: "Democratic", pic: UIImage(named: "Jim_Webb_official_110th_Congress_photo_(cropped).jpg")!))
    }
    
    func numberOfCandidates() -> Int {
        return candidates.count
    }
    
    func getCandidate(index index:Int) -> Candidate {
        if index < candidates.count {
            return candidates[index]
        } else {
            return Candidate(name: "<NoName>", party: "<NoParty>", pic: UIImage())
        }
    }
    
}

