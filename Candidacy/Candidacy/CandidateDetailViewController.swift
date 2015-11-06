//
//  CandidateDetailViewController.swift
//  Candidacy
//
//  Created by Kevin Avila on 10/23/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit
import Alamofire

let offset_HeaderStop:CGFloat = 40.0 // At this offset the Header stops its transformations
let offset_B_LabelHeader:CGFloat = 95.0 // At this offset the Black label reaches the Header
let distance_W_LabelHeader:CGFloat = 35.0 // The distance between the bottom of the Header and the top of the White Label

class CandidateDetailViewController: UIViewController, UIScrollViewDelegate {
    
    // This gets set by the presenting view controller
    var candidate:Candidate? = nil
    
    @IBOutlet weak var profileWhiteBackground: UIView!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var candidateNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet var headerImageView:UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    //@IBOutlet var headerBlurImageView:UIImageView!
    //var blurredHeaderImageView:UIImageView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        candidateNameLabel.text = candidate!.name
        profileImage.image = candidate?.getPic()
        profileImage.layer.cornerRadius = 0.5 * profileImage.bounds.size.width
        profileWhiteBackground.layer.cornerRadius = 0.5 * profileWhiteBackground.bounds.size.width
        profileImage.clipsToBounds = true
        self.navigationController?.navigationBarHidden = true
        
        scrollView.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // Header - Image
        
        headerImageView = UIImageView(frame: header.bounds)
        headerImageView?.image = candidate?.getPic()
        headerImageView?.contentMode = UIViewContentMode.ScaleAspectFill
        header.insertSubview(headerImageView, belowSubview: headerLabel)
        
        // Header - Blurred Image
        
//        headerBlurImageView = UIImageView(frame: header.bounds)
//        headerBlurImageView?.image = UIImage(named: "header_bg")?.blurredImageWithRadius(10, iterations: 20, tintColor: UIColor.clearColor())
//        headerBlurImageView?.contentMode = UIViewContentMode.ScaleAspectFill
//        headerBlurImageView?.alpha = 0.0
//        header.insertSubview(headerBlurImageView, belowSubview: headerLabel)
        
        header.clipsToBounds = true
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.y
        //var avatarTransform = CATransform3DIdentity
        var headerTransform = CATransform3DIdentity
        
        // PULL DOWN -----------------
        
        if offset < 0 {
            
            let headerScaleFactor:CGFloat = -(offset) / header.bounds.height
            let headerSizevariation = ((header.bounds.height * (1.0 + headerScaleFactor)) - header.bounds.height)/2.0
            headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
            headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)
            
            header.layer.transform = headerTransform
        }  else {
            
            // Header -----------
            
            headerTransform = CATransform3DTranslate(headerTransform, 0, max(-offset_HeaderStop, -offset), 0)
            
            //  ------------ Label
            
            let labelTransform = CATransform3DMakeTranslation(0, max(-distance_W_LabelHeader, offset_B_LabelHeader - offset), 0)
            headerLabel.layer.transform = labelTransform
            
            //  ------------ Blur
            
            //headerBlurImageView?.alpha = min (1.0, (offset - offset_B_LabelHeader)/distance_W_LabelHeader)
        }
        
        // Apply Transformations
        
        header.layer.transform = headerTransform
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
