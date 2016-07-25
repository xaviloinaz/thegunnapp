//
//  EventInfoViewController.swift
//  TheGunnApp
//
//  Created by Alan Chen on 7/24/16.
//  Copyright © 2016 Alan Chen. All rights reserved.
//

import UIKit

class EventInfoViewController: UIViewController {
    
   
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var date: UILabel!
//    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var startingTime: UILabel!
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var desc: UILabel!
  
    @IBOutlet weak var descriptionText: UITextView!
    
    @IBOutlet weak var summary: UITextView!
    var thisEvent = Event()
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController!.navigationBar.barTintColor = UIColor.redColor()
        // Do any additional setup after loading the view, typically from a nib.
//        navigationController!.navigationBar.barTintColor = UIColor.redColor()
        let ev = DownloadJSON()
        
        summary.text = thisEvent.summary!
        if((thisEvent.startDate) != ""){
//            print(event.startDate!)
            date.text = "Date  -  " + ev.dateString(thisEvent.startDate!)
            startingTime.text = "Time  -  All Day"
        }
        else if((thisEvent.startTime) != ""){
           date.text = "Date  -  " + ev.dateString(thisEvent.startTime!)
           startingTime.text = "Time  -  " + ev.timeString(thisEvent.startTime!) + " - " + ev.timeString(thisEvent.endTime)
        }
        else{
            date.text = ""
            startingTime.text = ""
        }
        
        if(thisEvent.location != ""){
            location.text = "Location  -  " + thisEvent.location!
        }
        else{
            location.text = "Location  -  Unspecified"
        }

        status.text = "Status  -  Confirmed"
        desc.text = "DESCRIPTION: "
        if(thisEvent.description != ""){
            descriptionText.text = thisEvent.description
        }
        else{
            desc.hidden = true
            descriptionText.hidden = true
        }
        descriptionText.editable = false
        summary.editable = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}










