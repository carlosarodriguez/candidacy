//
//  CandidatesViewController.swift
//  Candidacy
//
//  Created by Kevin Avila on 10/17/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit
import REFrostedViewController
import Alamofire


class CandidatesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let reuseIdentifier = "candidatePicID"
    var data:CandidatesDataModel = CandidatesDataModel()
    
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
        
        Alamofire.request(.GET, tempCandidate.picURL).response() {
            (_, _, data, _) in
            let image = UIImage(data: data!)
            cell.candidatePhoto.image = image
        }
        
        //cell.candidatePhoto.image = cropToBounds(tempCandidate.getPic())
        
        return cell
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
    
    
}

