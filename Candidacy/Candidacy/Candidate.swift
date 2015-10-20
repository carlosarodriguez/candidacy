//
//  Candidate.swift
//  Candidacy
//
//  Created by Kevin Avila on 10/18/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Candidate {
    
    private var _name:String = ""
    private var _state:String = ""
    private var _party:String = ""
    private var _votes:Int = 0 // could come in handy when Poll is implemented
    private var _picURL:String = ""
    
    var name:String {
        get {
            return _name
        }
        set (newValue) {
            _name = newValue
        }
    }
    
    var state:String {
        get {
            return _state
        }
        set(newVal) {
            _state = newVal
        }
    }
    
    var party:String {
        get {
            return _party
        }
        set(newVal) {
            _party = newVal
        }
    }
    
    var votes:Int {
        get {
            return _votes
        }
        set(newVal) {
            _votes = newVal
        }
    }
    
    var picURL:String {
        get {
            return _picURL
        }
        set(newVal) {
            _picURL = newVal
        }
    }
    
//    func getPic() -> UIImage {
//        return pic
//    }
    
    init(name:String, party:String, picURL:String) {
        self.name = name
        self.party = party
        self.picURL = picURL
    }
    
//    convenience init() {
//        self.init(name:"<NoName>", state:"<NoState>", party:"<NoParty>")
//    }
    
}
