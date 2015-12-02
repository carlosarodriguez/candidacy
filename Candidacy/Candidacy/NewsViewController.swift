//
//  ViewController.swift
//  Candidacy
//
//  Created by Kevin Avila on 10/11/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit
import Alamofire
import REFrostedViewController
import SafariServices
import Parse


class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    private var articles:[NewsArticle] = [NewsArticle]()
    var delegate:CandidateParseProtocol? = nil
    let data:CandidatesDataModel = CandidatesDataModel()
    var candidates:[Candidate] = [Candidate]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        getArticles()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        dispatch_async(dispatch_get_global_queue(Int(QOS_CLASS_BACKGROUND.rawValue), 0)) {
            self.loadCandidatesFromParse()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("newsCell", forIndexPath:indexPath) as! NewsCell
        cell.headlineLabel.text = articles[indexPath.row].headline
        cell.articlePreviewLabel.text = articles[indexPath.row].snippet
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let index:Int = indexPath.row
        let article = self.articles[index]
        let url:NSURL = NSURL(string: article.url)!
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
        let svc = SFSafariViewController(URL: url)
        self.presentViewController(svc, animated: true, completion: nil)
    }

    
    func getArticles() {
        //self.articles = [NewsArticle]()
        var pageNum = 0
        while (pageNum < 5) {
            let urlPath = "http://api.nytimes.com/svc/search/v2/articlesearch.json?q=2016+presidential+election&sort=newest&page=" + String(pageNum) + "&api-key=2c1bfd3f625c27d8a34f2a444bee93cd:5:70064203"
            Alamofire.request(.GET, urlPath)
                .responseJSON { response in
                
                    if let value: AnyObject = response.result.value {
                        // handle the results as JSON, without a bunch of nested if loops
                        let json = JSON(value)
                        let docs = json["response"]["docs"].array!
                        for (var i = 0; i < docs.count; ++i) {
                            let article = docs[i]
                            let headline = article["headline"]["main"]
                            let snippet = article["snippet"]
                            let url = article["web_url"]
                            let pub_date = article["pub_date"]
                            let multimedia = article["multimedia"].array!
                            if multimedia.count > 0 {
                                let thumbnail_url = multimedia[0]["url"]
                                //print(thumbnail_url)
                            }
                            //print("-------------------")
                            self.articles.append(NewsArticle(headline: String(headline), snippet: String(snippet), url: String(url), pub_date: String(pub_date)))
                        }
                        dispatch_async(dispatch_get_main_queue()) {
                            self.tableView.reloadData()
                        }
                    }
//                    for (var i = 0; i < self.articles.count; ++i) {
//                        print(self.articles[i].pub_date)
//                    }
            }
            pageNum++
        }
    }
    
    func loadCandidatesFromParse() {
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
                            //let parseID = "anything"
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
                            //let profileInfo = [String:String]() // this dictionary will hold info needed for the candidates profiles (personal details, bio, etc.)
                            
                            //turn urls into UIImage
                            let profilePicture = UIImage(data: NSData(contentsOfURL: NSURL(string: profilePictureURL)!)!)
                            let banner = UIImage(data: NSData(contentsOfURL: NSURL(string: bannerURL)!)!)
                            
                            // turn the PFFile profilePictureFile into a UIImage
                            //                        var profilePicture = UIImage()
                            //                        if let profilePictureFile = object["profilePicture"] as? PFFile {
                            //                            profilePictureFile.getDataInBackgroundWithBlock({
                            //                                (imageData: NSData?, error: NSError?) -> Void in
                            //                                if error == nil {
                            //                                    profilePicture = UIImage(data: imageData!)!
                            //                                }
                            //                            })
                            //                        }
                            //
                            //                        // turn the PFFile bannerFie into a UIImage
                            //                        var banner = UIImage()
                            //                        let bannerFile = object["bannerPicture"] as! PFFile
                            //                        bannerFile.getDataInBackgroundWithBlock({
                            //                            (imageData: NSData?, error: NSError?) -> Void in
                            //                            if error == nil {
                            //                                banner = UIImage(data: imageData!)!
                            //                            }
                            //                        })
                            
                            
                            // add new Candidate to the Candidate array
                            self.candidates.append(Candidate(firstName: firstName, lastName: lastName, state: state, party: politicalParty, active: active, website: website, facebook: facebook, twitter: twitter, pic: profilePicture!, banner: banner!))//, profileInfo: profileInfo)
                        }
                        dispatch_async(dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)) {
                            let defaults = NSUserDefaults.standardUserDefaults()
                            let encodedData = NSKeyedArchiver.archivedDataWithRootObject(self.candidates)
                            defaults.setObject(encodedData, forKey: "candidates")
                            defaults.synchronize()
                        }
//                        self.delegate = CandidatesViewController()
//                        self.delegate?.receiveParseData(self.data)
                    }
                } else {
                    // Log details of the failure
                    print("Error: \(error!) \(error!.userInfo)")
                }
            }
        
        
    }

    
    @IBAction func showMenu(sender: AnyObject) {
        self.view.endEditing(true)
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.presentMenuViewController()
    }

}

