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
    private var _parseID = ""
    private var _firstName:String = ""
    private var _lastName:String = ""
    private var _name:String = ""
    private var _state:String = ""
    private var _party:String = ""
    private var _active:Bool = false
    private var _votes:Int = 0  // could come in handy when Poll is implemented
    private var _website:String = ""
    private var _facebook:String = ""
    private var _twitter:String = ""
    private var pic:UIImage = UIImage()
    private var banner:UIImage = UIImage()
    
    var parseID:String {
        get {
            return _parseID
        }
        set (newValue) {
            _parseID = newValue
        }
    }
    
    var firstName:String {
        get {
            return _firstName
        }
        set (newValue) {
            _firstName = newValue
        }
    }
    
    var lastName:String {
        get {
            return _lastName
        }
        set (newValue) {
            _lastName = newValue
        }
    }
    
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
    
    var active:Bool {
        get {
            return _active
        }
        set(newVal) {
            _active = newVal
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
    
    var website:String {
        get {
            return _website
        }
        set(newVal) {
            _website = newVal
        }
    }

    var facebook:String {
        get {
            return _facebook
        }
        set(newVal) {
            _facebook = newVal
        }
    }

    var twitter:String {
        get {
            return _twitter
        }
        set(newVal) {
            _twitter = newVal
        }
    }
    
    func getPic() -> UIImage {
        return pic
    }
    
    func getBanner() -> UIImage {
        return banner
    }
    
    init(parseID:String, firstName:String, lastName:String, state:String, party:String, active:Bool, website:String, facebook:String, twitter:String, pic:UIImage, banner:UIImage) {
        self.parseID = parseID
        self.firstName = firstName
        self.lastName = lastName
        self.name = firstName + " " + lastName
        self.state = state
        self.party = party
        self.active = active
//        self.votes = votes
        self.website = website
        self.facebook = facebook
        self.twitter = twitter
        self.pic = pic
        self.banner = banner
    }
    
//    convenience init() {
//        self.init(name:"<NoName>", state:"<NoState>", party:"<NoParty>")
//    }
    
}
