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
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var startingTime: UILabel!
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var desc: UILabel!
  
    
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
            date.text = "DATE:  " + ev.dateString(thisEvent.startDate!)
            startingTime.text = "TIME:  All Day"
        }
        else if((thisEvent.startTime) != ""){
           date.text = "DATE:  " + ev.dateString(thisEvent.startTime!)
           startingTime.text = "TIME:  " + ev.timeString(thisEvent.startTime!) + " - " + ev.timeString(thisEvent.endTime)
        }
        else{
            date.text = ""
            startingTime.text = ""
        }
        
        if(thisEvent.location != ""){
            location.text = "LOCATION: " + thisEvent.location!
        }
        else{
            location.text = "LOCATION:  Unspecified"
        }

        status.text = "STATUS: Confirmed"
        desc.text = "DESCRIPTION: " + thisEvent.description
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}










