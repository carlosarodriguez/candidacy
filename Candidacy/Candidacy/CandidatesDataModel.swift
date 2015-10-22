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
        candidates.append(Candidate(name: "Jeb Bush", party: "Republican", pic: UIImage(named: "Governor_of_Florida_Jeb_Bush_2015_in_NH_by_Michael_Vadon_(cropped).jpg")!))
        candidates.append(Candidate(name: "Ben Carson", party: "Republican", pic: UIImage(named: "Dr._Ben_Carson_in_New_Hampshire_on_August_13th,_2015_1_by_Michael_Vadon_17_(cropped).jpg")!))
        candidates.append(Candidate(name: "Chris Christie", party: "Republican", pic: UIImage(named: "Chris_Christie_April_2015_(cropped).jpg")!))
        candidates.append(Candidate(name: "Ted Cruz", party: "Republican", pic: UIImage(named: "Ted_Cruz,_official_portrait,_113th_Congress_(cropped_2).jpg")!))
        candidates.append(Candidate(name: "Carly Fiorina", party: "Republican", pic: UIImage(named: "Carly_Fiorina_August_2015.jpg")!))
        candidates.append(Candidate(name: "Jim Gilmore", party: "Republican", pic: UIImage(named: "Jim_Gilmore_2015.jpg")!))
        candidates.append(Candidate(name: "Lindsey Graham", party: "Republican", pic: UIImage(named: "Lindsey_Graham,_official_Senate_photo_portrait_cropped.jpg")!))
        candidates.append(Candidate(name: "Mike Huckabee", party: "Republican", pic: UIImage(named: "Mike_Huckabee_at_2014_CPAC_(cropped).jpg")!))
        candidates.append(Candidate(name: "Bobby Jindal", party: "Republican", pic: UIImage(named: "Governor_of_Louisiana_Bobby_Jindal_at_New_Hampshire_Education_Summit_The_Seventy-Four_August_19th,_2015_by_Michael_Vadon_132_(cropped).jpg")!))
        candidates.append(Candidate(name: "John Kasich", party: "Republican", pic: UIImage(named: "Governor_John_Kasich.jpg")!))
        candidates.append(Candidate(name: "George Pataki", party: "Republican", pic: UIImage(named: "George_Pataki_August_2015.jpg")!))
        candidates.append(Candidate(name: "Rand Paul", party: "Republican", pic: UIImage(named: "Rand_Paul,_official_portrait,_112th_Congress.jpg")!))
        candidates.append(Candidate(name: "Marco Rubio", party: "Republican", pic: UIImage(named: "126px-Marco_Rubio,_Official_Portrait,_112th_Congress.jpg")!))
        candidates.append(Candidate(name: "Rick Santorum", party: "Republican", pic: UIImage(named: "Rick_Santorum_by_Gage_Skidmore_8.jpg")!))
        candidates.append(Candidate(name: "Donald Trump", party: "Republican", pic: UIImage(named: "Donald_Trump_September_3_2015.jpg")!))
        candidates.append(Candidate(name: "Jill Stein", party: "Green", pic: UIImage(named: "100px-Jill_Stein_2012.jpg")!))
        candidates.append(Candidate(name: "Robert David Steele", party: "Libertarian", pic: UIImage(named: "Steele_headshot_never_used_before_(afghanistan).jpg")!))
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

