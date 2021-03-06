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
        let specialColor = UIColor(red: 255.0/255.0, green: 14.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        navigationController!.navigationBar.barTintColor = specialColor
        super.viewDidLoad()
        //        navigationController!.navigationBar.barTintColor = UIColor.redColor()
        // Do any additional setup after loading the view, typically from a nib.
        //        navigationController!.navigationBar.barTintColor = UIColor.redColor()
        let ev = DownloadJSON()
        print(thisEvent)
        print(thisEvent.summary!.characters.count)
        if thisEvent.summary!.characters.count <= 33 {
            summary.font = UIFont.systemFont(ofSize: 22)
        } else if thisEvent.summary!.characters.count > 34 {
            summary.font = UIFont.systemFont(ofSize: 18)
        }
//        summary.adjustFontSizeToFitWidth = true
//        } else if thisEvent.summary!.characters.count <= 42 {
//            summary.font = UIFont.systemFontOfSize(15)
//        } else if thisEvent.summary!.characters.count <= 45 {
//            summary.font = UIFont.systemFontOfSize(14)
//        } else if thisEvent.summary!.characters.count <= 47 {
//            summary.font = UIFont.systemFontOfSize(13)
//        } else if thisEvent.summary!.characters.count <= 50 {
//            summary.font = UIFont.systemFontOfSize(12)
//        } else {
//            summary.font = UIFont.systemFontOfSize(11)
//        }
        
        
        summary.text = thisEvent.summary!
//        let fixedWidth = summary.frame.size.width
//        summary.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
//        let newSize = summary.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
//        var newFrame = summary.frame
//        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
//        summary.frame = newFrame;
        
//        var frame: CGRect?
//        frame = summary.frame;
//        frame!.size.height = summary.contentSize.height;
//        summary.frame = frame!;
        //       date.font = UIFont(name: "kannada", size: 106)
        if((thisEvent.startDate) != ""){
            
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
            desc.isHidden = true
            descriptionText.isHidden = true
        }
        descriptionText.isEditable = false
        summary.isEditable = false
        desc.isEditable = false
        date.isEditable = false
        startingTime.isEditable = false
        summary.isScrollEnabled = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}




