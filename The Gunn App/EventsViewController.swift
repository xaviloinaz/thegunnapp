//
//  EventsViewController.swift
//  The Gunn App
//
//  Created by Xavi Loinaz on 6/5/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//
import Foundation
import GoogleAPIClient
import GTMOAuth2
import UIKit



class EventsViewController: UITableViewController {
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    // If modifying these scopes, delete your previously saved credentials by
    // resetting the iOS simulator or uninstall the app.
    private let scopes = [kGTLAuthScopeCalendarReadonly]
    private let kKeychainItemName = "Google Calendar API"
    //    private let kClientID = "999725457631-j71getcvrp65q372a1mfnc7cqajisuh1.apps.googleusercontent.com"
    private let kClientID = "68302956867-mulu2q103u9jg7faua2mi3gka1g0k07d.apps.googleusercontent.com"
    private let service = GTLServiceCalendar()
    
    let url = NSURL(string: "https://www.googleapis.com/calendar/v3/calendars/email.gmail.com/events?maxResults=15&key=APIKey-here")
    
    let output = UITextView()
    var eventNames = [String]()
    var eventDates = [String]()
    var events = [Event]()
    var stations = [String]()
    var ev: DownloadJSON?
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // When the view loads, create necessary subviews
    // and initialize the Google Calendar API service
    override func viewDidLoad() {
        var specialColor = UIColor(red: 255.0/255.0, green: 14.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        navigationController!.navigationBar.barTintColor = specialColor
        super.viewDidLoad()
        //        downloadAndParseJSON()
        ev = DownloadJSON()
        events = ev!.downloadAndParseJSON()
        
        
        for index in 0...events.count-1 {
        }
        //        output.frame = view.bounds
        //        output.editable = false
        //        output.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        //        output.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        
        //        view.addSubview(output)
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        
        
        
        
        
        
        let requestURL: NSURL = NSURL(string: "http://www.learnswiftonline.com/Samples/subway.json")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest)
        
        //            let httpResponse = response as! NSHTTPURLResponse
        //            let statusCode = httpResponse.statusCode
        
        //            if (statusCode == 200) {
        print("Everyone is fine, file downloaded successfully.")
        
        //                do{

        stations.append("first")
        stations.append("second")
        stations.append("third")
        stations.append("fourth")
        stations.append("fifth")
        //                } catch {
        //                    print("Error with Json")
        //                }
        
    }
    
    
    
    
    // MARK: - Table view data source
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        //        downloadAndParseJSON()
        return 1
        
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        downloadAndParseJSON()
        // return events.count
        return 300
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //        downloadAndParseJSON()
        
        
        
        
        
        
        
        
        let cellIdentifier = "EventsViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventsViewCell
        
        
        
        //        let cell = tableView.dequeueReusableCellWithIdentifier("EventsViewCell", forIndexPath: indexPath) as! EventsViewCell
        
        // Configure the cell...
        
        let event = events[indexPath.row]
        
        //        cell.summary.text = event.summary
        //        cell.dayAndDate.text = String(event.day) + ", " + String(event.date)
        //        cell.startingTime.text = event.startTime
        
        //        let sumthin = stations[indexPath.row]
        var text = event.summary!
        
        
        //while (text[text.characters.count-1] == " ") {
        //    text = text.substringToIndex(text.endIndex.predecessor())
        //}
        
        cell.summary.text = String(text)
        
        
        
        if (text.characters.count > 31){
            cell.summary.font = UIFont.systemFontOfSize(18)
        }
        if(text.characters.count > 39){
            cell.summary.font = UIFont.systemFontOfSize(14)
        }
        if((event.startDate) != ""){
            cell.dayAndDate.text = ev!.dateString(event.startDate!)
            //            cell.startingTime.hidden = true
            //                ev!.timeString(event.startTime!) + " - " + ev!.timeString(event.endTime)
        }
        else if((event.startTime) != ""){
            cell.dayAndDate.text = ev!.dateString(event.startTime!)
            //            cell.startingTime.text = ev!.timeString(event.startTime!) + " - " + ev!.timeString(event.endTime)
        }
        else{
            cell.dayAndDate.text = ""
            //            cell.startingTime.text = ""
        }
        
        if cell.summary.text!.characters.count > 37 {
            cell.summary.font = UIFont.systemFontOfSize(11)
        } else if cell.summary.text!.rangeOfString("STAFF DEVELOPMENT DAY") != nil{
            cell.summary.font = UIFont.systemFontOfSize(11)
        }else {
            cell.summary.font = UIFont.systemFontOfSize(17)
        }

        
        return cell
        
        
        /*
         let cellIdentifier = "EventsViewCell"
         
         let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventsViewCell
         
         //        let event: Event
         
         cell.summary.text = "bla"
         
         return cell
         
         
         
         */
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
        var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow!
        
        
        
        var destViewController = segue.destinationViewController as! EventInfoViewController
        
        
        
        var thisEvent : Event = events[indexPath.row]
        
        
        
        //        destViewController.thisStaff = thisStaff
        
        
        
        //        if searchController.active && searchController.searchBar.text != "" {
        
        //            thisStaff = filteredStaff[indexPath.row]
        
        destViewController.thisEvent = thisEvent
        
        //        } else {
        
        //            thisStaff = staffs[indexPath.row]
        
        
        //        }
        
        
        
    }
}


