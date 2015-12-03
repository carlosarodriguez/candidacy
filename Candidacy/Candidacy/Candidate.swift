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

class Candidate: NSObject, NSCoding {
    //private var _parseID = ""
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
    private var _profURL:String = ""
    private var _banURL:String = ""
    
    init(firstName:String, lastName:String, state:String, party:String, active:Bool, website:String, facebook:String, twitter:String, pic:UIImage, banner:UIImage, profURL:String, banURL:String) {//, profileInfo: Dictionary<String, String>) {
        super.init()
        //self.parseID = parseID
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
        self.profURL = profURL
        self.banURL = banURL
        
    }
    
    var profURL:String {
        get {
            return _profURL
        }
        set (newValue) {
            _profURL = newValue
        }
    }
    
    var banURL:String {
        get {
            return _banURL
        }
        set (newValue) {
            _banURL = newValue
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
        return UIImage(data: NSData(contentsOfURL: NSURL(string: profURL)!)!)!
    }
    
    func getBanner() -> UIImage {
        return UIImage(data: NSData(contentsOfURL: NSURL(string: banURL)!)!)!
    }
    
    @objc required convenience init(coder aDecoder: NSCoder) {
        //let parseID = aDecoder.decodeObjectForKey("parseID") as! String
        let firstName = aDecoder.decodeObjectForKey("firstName") as! String
        let lastName = aDecoder.decodeObjectForKey("lastName") as! String
        let state = aDecoder.decodeObjectForKey("state") as! String
        let party = aDecoder.decodeObjectForKey("party") as! String
        let active = aDecoder.decodeBoolForKey("active")
        let website = aDecoder.decodeObjectForKey("website") as! String
        let facebook = aDecoder.decodeObjectForKey("facebook") as! String
        let twitter = aDecoder.decodeObjectForKey("twitter") as! String
        let pic = aDecoder.decodeObjectForKey("pic") as! UIImage
        let banner = aDecoder.decodeObjectForKey("banner") as! UIImage
        let profURL = aDecoder.decodeObjectForKey("profURL") as! String
        let banURL = aDecoder.decodeObjectForKey("banURL") as! String

        self.init(firstName: firstName, lastName: lastName, state: state, party: party, active: active, website: website, facebook: facebook, twitter: twitter, pic:pic, banner:banner, profURL:profURL, banURL:banURL)
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        //aCoder.encodeObject(parseID, forKey: "parseId")
        aCoder.encodeObject(firstName, forKey: "firstName")
        aCoder.encodeObject(lastName, forKey: "lastName")
        aCoder.encodeObject(state, forKey: "state")
        aCoder.encodeObject(party, forKey: "party")
        aCoder.encodeBool(active, forKey: "active")
        aCoder.encodeObject(website, forKey: "website")
        aCoder.encodeObject(facebook, forKey: "facebook")
        aCoder.encodeObject(twitter, forKey: "twitter")
        aCoder.encodeObject(pic, forKey: "pic")
        aCoder.encodeObject(banner, forKey: "banner")
        aCoder.encodeObject(profURL, forKey: "profURL")
        aCoder.encodeObject(banURL, forKey: "banURL")
    }
}
