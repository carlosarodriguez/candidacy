//
//  NewsArticle.swift
//  Candidacy
//
//  Created by Kevin Avila on 11/7/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import Foundation
import UIKit

class NewsArticle {
    
    private var _headline:String = ""
    private var _snippet:String = ""
    //private var thumbnail:UIImage = UIImage()
    
    var headline:String {
        get {
            return _headline
        }
        set (newValue) {
            _headline = newValue
        }
    }
    
    var snippet:String {
        get {
            return _snippet
        }
        set(newVal) {
            _snippet = newVal
        }
    }
    
//    func getThumbnail() -> UIImage {
//        return thumbnail
//    }
    
    init(headline:String, snippet:String) {
        self.headline = headline
        self.snippet = snippet
        //self.thumbnail = thumbnail
    }
}