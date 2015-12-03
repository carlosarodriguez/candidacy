//
//  PollViewController.swift
//  Candidacy
//
//  Created by Kevin Avila on 11/22/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit
import Parse
import NMPopUpViewSwift

class PollViewController: UIViewController, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var ageGroupField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var candidateField: UITextField!
    @IBOutlet weak var politicalAffliationField: UITextField!
    var popViewController : PopUpViewControllerSwift = PopUpViewControllerSwift(nibName: "PopUpViewController", bundle: nil)
    var age: String = ""
    var state: String = ""
    var candidateSelected: String = ""
    var political: String = ""
    
    //pickerView options 
    let ageGroups = ["18-24","25-35", "35-44", "45-54", "55-64", "65+"]
    let states = ["AK","AL","AR","AZ","CA","CO","CT","DC","DE","FL","GA","GU","HI","IA","ID", "IL","IN","KS","KY","LA","MA","MD","ME","MH","MI","MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY", "OH","OK","OR","PA","PR","PW","RI","SC","SD","TN","TX","UT","VA","VI","VT","WA","WI","WV","WY"]
    let candidates = ["Bernie Sanders", "Hillary Clinton", "Martin O'Maley", "Jeb Bush", "Ben Carson", "Chris Christie", "Ted Cruz", "Carly Fiorina", "Jim Gilmore", "Linsey Graham", "Mike Huckabee", "John Kasich", "George Pataki", "Rand Paul", "Marco Rubio", "Rick Santorum", "Donald Trump", "Jill Stein", "Robert David Steele"]
    let politicalAffiliation = ["Democrat", "Republican", "Other"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let attr = NSDictionary(object: UIFont(name: "avenir", size: 16.0)!, forKey: NSFontAttributeName)
        UISegmentedControl.appearance().setTitleTextAttributes(attr as [NSObject : AnyObject], forState: .Normal)
        
        //setup pickerviews for textfields
        let agePicker = UIPickerView()
        let statePicker = UIPickerView()
        let candidatePicker = UIPickerView()
        let politicalPicker = UIPickerView()
        agePicker.tag = 0
        statePicker.tag = 1
        candidatePicker.tag = 2
        politicalPicker.tag = 3
        agePicker.delegate = self
        statePicker.delegate = self
        candidatePicker.delegate = self
        politicalPicker.delegate = self
        
        //toolbar for pickerView
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 247/255, green: 80/255, blue: 67/255, alpha: 1.0)
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "dismissPicker")
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: "dismissPicker")
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        
        //relate pickerViews to respective fields
        self.ageGroupField.inputView = agePicker
        self.stateField.inputView = statePicker
        self.candidateField.inputView = candidatePicker
        self.politicalAffliationField.inputView = politicalPicker
        self.ageGroupField.inputAccessoryView = toolBar
        self.stateField.inputAccessoryView = toolBar
        self.candidateField.inputAccessoryView = toolBar
        self.politicalAffliationField.inputAccessoryView = toolBar
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissPicker")
        view.addGestureRecognizer(tap)
    }
       
    func dismissPicker() {
        self.view.endEditing(true)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int  {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return ageGroups.count
        } else if pickerView.tag == 1 {
            return states.count
        } else if pickerView.tag == 2 {
            return  candidates.count
        } else if  pickerView.tag == 3 {
            return politicalAffiliation.count
        }
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return ageGroups[row]
        } else if pickerView.tag == 1 {
            return states[row]
        } else if pickerView.tag == 2 {
            return candidates[row]
        } else if pickerView.tag == 3 {
            return politicalAffiliation[row]
        }
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        
        if pickerView.tag == 0 {
            self.ageGroupField.text = ageGroups[row]
            self.age = ageGroups[row]
        } else if pickerView.tag == 1 {
            self.stateField.text = states[row]
            self.state = states[row]
        } else if pickerView.tag == 2 {
            self.candidateField.text = candidates[row]
            self.candidateSelected = candidates[row]
        } else if pickerView.tag == 3 {
            self.politicalAffliationField.text = politicalAffiliation[row]
            self.political = politicalAffiliation[row]
        }
    }
    
    
    //On button click show results from polls from parse
    @IBAction func showResults(sender: AnyObject) {
        
    }
    
    //on confirm button click submit results to parse
    @IBAction func confirmPollSubmission(sender: AnyObject) {

        //prompt user with popupview using framework
        let image = maskRoundedImage(UIImage(named: "iTunesArtwork@2x.png")!, radius: 260)
        let bundle = NSBundle(forClass: PopUpViewControllerSwift.self)
        if (UIDevice.currentDevice().userInterfaceIdiom == .Pad)
        {
            self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPad", bundle: bundle)
            self.popViewController.title = "Poll Submitted!"
            self.popViewController.showInView(self.view, withImage: image, withMessage: "Poll Submitted. Thank you for your time!", animated: true)
        } else {
            if UIScreen.mainScreen().bounds.size.width > 320 {
                if UIScreen.mainScreen().scale == 3 {
                    self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPhone6Plus", bundle: bundle)
                    self.popViewController.title = "Poll Submitted!"
                    self.popViewController.showInView(self.view, withImage: image, withMessage: "Poll Submitted. Thank you for your time!", animated: true)
                } else {
                    self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPhone6", bundle: bundle)
                    self.popViewController.title = "Poll Submitted!"
                    self.popViewController.showInView(self.view, withImage: image, withMessage: "Poll Submitted. Thank you for your time!", animated: true)
                }
            } else {
                self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController", bundle: bundle)
                self.popViewController.title = "Poll Submitted!"
                self.popViewController.showInView(self.view, withImage: image, withMessage: "Poll Submitted. Thank you for your time!", animated: true)
            }
        }
        
        //save data to parse
        let poll = PFObject(className:"Poll")
        poll["ageGroup"] = self.age
        poll["state"] = self.state
        poll["candidate"] = self.candidateSelected
        poll["politicalAfiliation"] = self.political
        poll.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }
    }
    
    func maskRoundedImage(image: UIImage, radius: Float) -> UIImage {
        var imageView: UIImageView = UIImageView(image: image)
        var layer: CALayer = CALayer()
        layer = imageView.layer
        
        layer.masksToBounds = true
        layer.cornerRadius = CGFloat(radius)
        
        UIGraphicsBeginImageContext(imageView.bounds.size)
        layer.renderInContext(UIGraphicsGetCurrentContext()!)
        var roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return roundedImage
    }
    
    @IBAction func showMenu(sender: AnyObject) {
        self.view.endEditing(true)
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.presentMenuViewController()
    }
}
