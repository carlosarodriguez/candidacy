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
        candidates.append(Candidate(name: "Lincoln Chafee", party: "Democratic", picURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Lincoln_Chafee_official_portrait_%28cropped%29.jpg/114px-Lincoln_Chafee_official_portrait_%28cropped%29.jpg"))
        candidates.append(Candidate(name: "Hillary Clinton", party: "Democratic", picURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/HRC_in_Iowa_APR_2015.jpg/113px-HRC_in_Iowa_APR_2015.jpg"))
        candidates.append(Candidate(name: "Lawrence Lessig", party: "Democratic", picURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Lessig_%28cropped%29.png/103px-Lessig_%28cropped%29.png"))
        candidates.append(Candidate(name: "Martin O'Malley", party: "Democratic", picURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Governor_O%27Malley_Portrait_%28cropped%29.jpg/108px-Governor_O%27Malley_Portrait_%28cropped%29.jpg"))
        candidates.append(Candidate(name: "Bernie Sanders", party: "Democratic", picURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Bernie_Sanders_New_Orleans_rally_crop.jpg/121px-Bernie_Sanders_New_Orleans_rally_crop.jpg"))
        candidates.append(Candidate(name: "Jim Webb", party: "Democratic", picURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Jim_Webb_official_110th_Congress_photo_%28cropped%29.jpg/107px-Jim_Webb_official_110th_Congress_photo_%28cropped%29.jpg"))
    }
    
    func numberOfCandidates() -> Int {
        return candidates.count
    }
    
    func getCandidate(index index:Int) -> Candidate {
        if index < candidates.count {
            return candidates[index]
        } else {
            return Candidate(name: "<NoName>", party: "<NoParty>", picURL: "<NoPicURL>")
        }
    }
    
}

