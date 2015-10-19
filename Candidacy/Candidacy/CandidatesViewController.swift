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
        cell.candidatePhoto.image = tempCandidate.getPic()
        
        return cell
    }
    
    @IBAction func showMenu(sender: AnyObject) {
        self.view.endEditing(true)
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.presentMenuViewController()
    }
    
    
}

