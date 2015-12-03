//
//  CandidatesViewController.swift
//  Candidacy
//
//  Created by Kevin Avila on 10/17/15.
//  Copyright © 2015 CS378. All rights reserved.
//


import UIKit
import REFrostedViewController
import Parse
import ParseUI

class CandidatesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, CandidateParseProtocol{
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let reuseIdentifier = "candidatePicID"
    var indexOfSelectedCandidate:Int = 0
    var candidates:[Candidate] = [Candidate]()
    var imageBan: UIImage = UIImage()
    var candidateImage: UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get a reference to the global user defaults object
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
        let decoded = defaults.objectForKey("candidates") as! NSData
        let decodedCandidates = NSKeyedUnarchiver.unarchiveObjectWithData(decoded) as! [Candidate]
        self.candidates = decodedCandidates
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func receiveParseData(data: [Candidate]) {
        print(data.count)
        self.candidates = data
    }
    
    func callParse() {
        // execute Parse query
        let query = PFQuery(className:"Candidate")
        
        // findObjectsInBackgroundWithBlock executes block after query is done
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) candidates.")
                
                // populate Candidate array with objects
                if let objects = objects as [PFObject]! {
                    for object in objects {
                        // retrieve data from object
                        let firstName = object["firstName"] as! String
                        let lastName = object["lastName"] as! String
                        let politicalParty = object["politicalParty"] as! String
                        let state = object["state"] as! String
                        let active = object["activeCampaign"] as! Bool
                        let website = object["website"] as! String
                        let facebook = object["facebookURL"] as! String
                        let twitter = object["twitterURL"] as! String
                        let profilePictureURL = object["profilePictureURL"] as! String
                        let bannerURL = object["bannerURL"] as! String
                        
                        // add new Candidate to the Candidate array
                        self.candidates.append(Candidate(firstName: firstName, lastName: lastName, state: state, party: politicalParty, active: active, website: website, facebook: facebook, twitter: twitter, pic: self.candidateImage, banner: self.imageBan, profURL: profilePictureURL, banURL: bannerURL))
                    }
                    
                    let defaults = NSUserDefaults.standardUserDefaults()
                    let encodedData = NSKeyedArchiver.archivedDataWithRootObject(self.candidates)
                    defaults.setObject(encodedData, forKey: "candidates")
                    defaults.synchronize()
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.candidates.count//data.numberOfCandidates()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CandidatePhotoCell
        let index:Int = indexPath.row
        let tempCandidate:Candidate = self.candidates[index]//data.getCandidate(index: index)
        
        cell.candidateNameLabel.text = tempCandidate.name
        let imageName = tempCandidate.firstName + ".jpg"
        
        //cell.candidatePhoto.image = cropToBounds(tempCandidate.getPic())
        cell.candidatePhotoButton.setImage(UIImage(named: imageName), forState: .Normal)
        cell.candidatePhotoButton.layer.cornerRadius = 0.5 * cell.candidatePhotoButton.bounds.size.width
        cell.candidatePhotoButton.clipsToBounds = true
        
        return cell
    }
    
    @IBAction func candidatePhotoSelected(sender: AnyObject) {
        let touchPoint = collectionView.convertPoint(CGPoint.zero, fromView: sender as? UIView)
        if let indexPath = collectionView.indexPathForItemAtPoint(touchPoint) {
            indexOfSelectedCandidate = indexPath.row
        }
    }
    
    @IBAction func showMenu(sender: AnyObject) {
        self.view.endEditing(true)
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.presentMenuViewController()
    }
    
    func cropToBounds(image: UIImage) -> UIImage {
        
        let contextImage: UIImage = UIImage(CGImage: image.CGImage!)
        let width:CGFloat = image.size.width
        let height:CGFloat = image.size.width
        
        let rect: CGRect = CGRectMake(0.0, 0.0, width, height)
        
        // Create bitmap image from context using the rect
        let imageRef: CGImageRef = CGImageCreateWithImageInRect(contextImage.CGImage, rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(CGImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        
        return image
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Do something for the ShowDetail segue
        if segue.identifier == "showCandidateDetail" {
            
            // Get the destination view controller
            let detailVC:CandidateDetailViewController = segue.destinationViewController as! CandidateDetailViewController
            
            // Pass in the candidate object
            detailVC.candidate = self.candidates[indexOfSelectedCandidate]//data.getCandidate(index: indexOfSelectedCandidate)
        }
    }
    

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}

