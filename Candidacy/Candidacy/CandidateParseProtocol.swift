//
//  CandidateParseProtocol.swift
//  Candidacy
//
//  Created by Sam Wang on 12/2/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import Foundation
import Parse
import UIKit

protocol CandidateParseProtocol
{
    func receiveParseData(data: CandidatesDataModel)
}