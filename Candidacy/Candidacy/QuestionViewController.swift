//
//  File.swift
//  Candidacy
//
//  Created by Carlos Rodriguez on 10/20/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit


class QuestionViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UITextView!
    var question:String = ""
    var answer:String = ""
    
    var answers = ["Voting is one of the most important rights we have as citizens. However, in order to vote and voice your opinion, you must first register to vote with the state in which you currently reside. The rules and requirements of each state vary, so the first thing you need to do is read about your state's particular laws. Typically, registration is required at least 30 days before the election, but you'll want to check to make sure.\n\nYou'll then need to fill out a voter registration form for your state, print it, and send it off to your local election official.", "In order to vote in the United States, you have to meet certain basic requirements. Regardless of what state you live in, you must:\n- Be a citizen of the United States\n- Be a resident of the state in which you're planning to register\n- Be at least 18-years-old at the time of the next election\nBeyond that, each state has its own laws and regulations for voter eligibility.","If you can't make it to the polls on Election Day, you may be qualified to vote absentee. Absentee voting is conducted by mail, and sometimes in person, before Election Day. Contact your local election officials to request an absentee ballot application. Click here to find their contact information.\n\nSome states allow voters to vote early, even if they are able to make it to the polls on Election Day. This practice is often referred to as early voting or no-excuse absentee voting. Check to see if this is available in your state!\n\nMany college or university students temporarily living away from home need to vote absentee. To request that an absentee ballot be sent to the address where you are physically planning to be on Election Day, you must fill out an absentee ballot request application for your home state. Click here to check your individual state's Secretary of State to be sure what to do for YOUR state.", "Early Voting allows you to cast your vote ahead of time as a convenience for those who can't make it to the polls on election day. Over the past few elections, early voting has become increasingly popular. Thirty-two states provide some form of \"no excuse\" early voting, whether by mail-in absentee ballots or \"Early In-Person\" (EIP) ballots, permitting any registered voter to cast an early ballot. To find out which regulations apply to you, check and read about your state's rules for early voting. Keep in mind that before you can vote early, you must first register to vote.", "The location where you will vote on Election Day, also known as your \"polling place,\" is determined by your address. After you've registered to vote, you will receive a notification in the mail from the elections office. In some states, this notification will be a \"voter ID card.\" This notice will confirm that you are now a registered voter (congratulations!). The notice may also include information about where your polling place will be, so make sure you hold on to it.\n\nIn some states, you will receive a \"sample ballot\" as Election Day nears. This booklet or paper may include your specific polling place for your home address, so you should definitely save it. You may want to mark your \"sample ballot\" with your voting choices and bring it with you on Election Day.\n\nPolling places can change up until the last minute, so make sure to double-check your polling place online or by phone. Check with your local elections official (click here to find their contact information).", "The location where you will vote on Election Day, also known as your \"polling place,\" is determined by your address. After you've registered to vote, you will receive a notification in the mail from the elections office. In some states, this notification will be a \"voter ID card.\" This notice will confirm that you are now a registered voter (congratulations!). The notice may also include information about where your polling place will be, so make sure you hold on to it.\n\nIn some states, you will receive a \"sample ballot\" as Election Day nears. This booklet or paper may include your specific polling place for your home address, so you should definitely save it. You may want to mark your \"sample ballot\" with your voting choices and bring it with you on Election Day.\n\nPolling places can change up until the last minute, so make sure to double-check your polling place online or by phone. Check with your local elections official (click here to find their contact information)."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = question
        answerLabel.text = answer
        questionLabel.font = UIFont(name: "avenir-heavy", size: 22)
        answerLabel.font = UIFont(name: "avenir-medium", size: 16)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}