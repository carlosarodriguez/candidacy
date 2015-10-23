//
//  CandidatesViewController.swift
//  Candidacy
//
//  Created by Kevin Avila on 10/17/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit
import REFrostedViewController


class CandidatesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let reuseIdentifier = "candidatePicID"
    var data:CandidatesDataModel = CandidatesDataModel()
    var indexOfSelectedCandidate:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.numberOfCandidates()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CandidatePhotoCell
        let index:Int = indexPath.row
        let tempCandidate:Candidate = data.getCandidate(index: index)
        
        cell.candidateNameLabel.text = tempCandidate.name
    
        //cell.candidatePhoto.image = cropToBounds(tempCandidate.getPic())
        cell.candidatePhotoButton.setImage(tempCandidate.getPic(), forState: .Normal)
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
            detailVC.candidate = data.getCandidate(index: indexOfSelectedCandidate)
        }
    }
    
    
}

