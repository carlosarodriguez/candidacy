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


class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var articles:[NewsArticle] = [NewsArticle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getArticles()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
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
        let urlPath = "http://api.nytimes.com/svc/search/v2/articlesearch.json?q=2016+presidential+election&sort=newest&api-key=2c1bfd3f625c27d8a34f2a444bee93cd:5:70064203"
        Alamofire.request(.GET, urlPath)
            .responseJSON { response in
                
                if let value: AnyObject = response.result.value {
                    // handle the results as JSON, without a bunch of nested if loops
                    let json = JSON(value)
                    //let hits = json["response"]["meta"]["hits"].intValue
                    let docs = json["response"]["docs"].array!
                    //print(fa)
                    for (var i = 0; i < docs.count; ++i) {
                        let article = docs[i]
                        let headline = article["headline"]["main"]
                        let snippet = article["snippet"]
                        let url = article["web_url"]
                        print(url)
                        //print(snippet)
                        self.articles.append(NewsArticle(headline: String(headline), snippet: String(snippet), url: String(url)))
                    }
                    dispatch_async(dispatch_get_main_queue()) {
                        self.tableView.reloadData()
                    }
                }
        }
        //print(articles)
    }
    
    @IBAction func showMenu(sender: AnyObject) {
        self.view.endEditing(true)
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.presentMenuViewController()
    }

}

