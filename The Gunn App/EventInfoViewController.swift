//
//  EventInfoViewController.swift
//  TheGunnApp
//
//  Created by Xavi Loinaz on 7/31/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

import UIKit

class EventInfoViewController: UIViewController {
    
    
//    @IBOutlet weak var status: UILabel!
//    @IBOutlet weak var date: UILabel!
//    @IBOutlet weak var summary: UILabel!
//    @IBOutlet weak var startingTime: UILabel!
//    @IBOutlet weak var location: UILabel!
//    
//    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var desc: UITextView!
////    
//    @IBOutlet weak var summary: UITextView!
//    
//    @IBOutlet weak var startingTime: UITextView!
    @IBOutlet weak var descriptionText: UITextView!
//    @IBOutlet weak var date: UITextView!
    @IBOutlet weak var date: UITextView!
//    @IBOutlet weak var startTime: UITextView!
//    @IBOutlet weak var startingTime: UITextView!
    @IBOutlet weak var summary: UITextView!
    @IBOutlet weak var startingTime: UITextView!
    @IBOutlet weak var location: UITextView!
//    @IBOutlet weak var location: UITextView!
    var thisEvent = Event()
//    @IBOutlet weak var desc: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //        navigationController!.navigationBar.barTintColor = UIColor.redColor()
        // Do any additional setup after loading the view, typically from a nib.
        //        navigationController!.navigationBar.barTintColor = UIColor.redColor()
        let ev = DownloadJSON()
        print(thisEvent)
        summary.text = thisEvent.summary!
        print(thisEvent.summary!)
        //       date.font = UIFont(name: "kannada", size: 106)
        if((thisEvent.startDate) != ""){
            //            print(event.startDate!)
            
            date.text = "Date  -  " + ev.dateString(thisEvent.startDate!)
            startingTime.text = "Time  -  All Day"
        }
        else if((thisEvent.startTime) != ""){
            date.text = "Date  -  " + ev.dateString(thisEvent.startTime!)
            startingTime.text = "Time  -  " + ev.timeString(thisEvent.startTime!) + " - " + ev.timeString(thisEvent.endTime)
        }
        else {
            date.text = ""
            startingTime.text = ""
        }
        
        if(thisEvent.location != ""){
            location.text = "Location  -  " + thisEvent.location!
        }
        else{
            location.text = "Location  -  Unspecified"
        }
        
        //        status.text = "Status  -  Confirmed"
        //        desc.text = "DESCRIPTION: "
        if(thisEvent.description != ""){
            descriptionText.text = thisEvent.description
        }
        else{
            desc.hidden = true
            descriptionText.hidden = true
        }
        descriptionText.editable = false
        summary.editable = false
        desc.editable = false
        date.editable = false
        startingTime.editable = false
        summary.scrollEnabled = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}




