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
        super.viewDidLoad()
        navigationController!.navigationBar.barTintColor = UIColor.redColor()
        
        
        
        
        
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
                    /*
                    //let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    
                    let stations = json["stations"] as! [[String: AnyObject]]
                        
                        for station in stations {
                            
                            let name = station["stationName"] as! String
                                
                                let year = station["buildYear"] as! String
                                    print(name,year)
                            
                                
                            
                        
                        
                    }
                    */
                    stations.append("first")
                    stations.append("second")
                    stations.append("third")
                    stations.append("fourth")
                    stations.append("fifth")
//                } catch {
//                    print("Error with Json")
//                }
                
            }
    
//        task.resume()


        
        
        
    
    
    
    
    
    // MARK: - Table view data source
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
//        downloadAndParseJSON()
        return 1
        
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        downloadAndParseJSON()
        // return events.count
        return 5
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        downloadAndParseJSON()
        
        
        
        
        
        
        
        
        let cellIdentifier = "EventsViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventsViewCell
        
        

        
        // Configure the cell...
        
        let event = events[indexPath.row]
        
//        cell.summary.text = event.summary
//        cell.dayAndDate.text = String(event.day) + ", " + String(event.date)
//        cell.startingTime.text = event.startTime
        
//        let sumthin = stations[indexPath.row]
        let text = event.summary!
        cell.summary.text = String(text)
        if((event.startTime) != ""){
            cell.dayAndDate.text = ev!.dateString(event.startTime!)
            cell.startingTime.text = ev!.timeString(event.startTime!) + " - " + ev!.timeString(event.endTime)
        }else{
            cell.dayAndDate.text = ""
            cell.startingTime.text = ""
        }
        
        
        
        return cell

    }
}


        /*
         
         // Table view cells are reused and should be dequeued using a cell identifier.
         
         let cellIdentifier = "StaffTableViewCell"
         
         
         
         let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! StaffTableViewCell
         
         
         
         // Fetches the appropriate staff for the data source layout.
         
         let staff = staffs[indexPath.row]
         
         
         
         cell.staffName.text = staff.name
         
         cell.staffDepartment.text = staff.department
         
         
         
         return cell
         
         */




