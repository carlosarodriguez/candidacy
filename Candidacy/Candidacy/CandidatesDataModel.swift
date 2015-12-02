//
//  CandidatesDataModel.swift
//  Candidacy
//
//  Created by Kevin Avila on 10/18/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import Foundation
import UIKit
import Parse

class CandidatesDataModel {
    
    private var candidates:[Candidate] = [Candidate]()
        
    init() {
    }
    
    
    func numberOfCandidates() -> Int {
        return candidates.count
    }
    
    func addCandidate (parseID:String, firstName: String, lastName: String, state: String, politicalParty: String, activeCampaign: Bool, websiteURL: String, facebook: String, twitter: String, profilePicture: UIImage, banner: UIImage) {//, profileInfo: Dictionary<String,String>) {
        
        // initialize Candidate object with the above parameters
        let newCandidate = Candidate(firstName: firstName, lastName: lastName, state: state, party: politicalParty, active: activeCampaign, website: websiteURL, facebook: facebook, twitter: twitter, pic: profilePicture, banner: banner)//, profileInfo: profileInfo)
        
        // add new Candidate to the Candidate array
        self.candidates.append(newCandidate)
    }

    func getCandidate(index index:Int) -> Candidate {
        if index < candidates.count {
            return candidates[index]
        } else {
            return Candidate(firstName: "<NoFirstName>", lastName: "<NoLastname>", state: "<NoState>", party: "<NoPoliticalParty>", active: false, website: "<NoWebsite>", facebook: "<NoFacebook>", twitter: "<NoTwitter>", pic: UIImage(), banner: UIImage())// profileInfo: [String:String]())
        }
    }
}

