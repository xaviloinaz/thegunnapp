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
//        downloadAndParseJSON()
        navigationController!.navigationBar.barTintColor = UIColor.redColor()
        ev = DownloadJSON()
        events = ev!.downloadAndParseJSON();
        for index in 0...events.count-1 {
            print(events[index].summary!)
            print(ev!.timeString(events[index].startTime))
        }
//        output.frame = view.bounds
//        output.editable = false
//        output.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
//        output.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        
//        view.addSubview(output)
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        

        
        
/*
        let requestURL: NSURL = NSURL(string: "http://www.learnswiftonline.com/Samples/subway.json")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest)
        
        func yolo(data, response, error) -> Void {
            
            
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                do{
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    
                    if let stations = json["stations"] as? [[String: AnyObject]] {
                        
                        for station in stations {
                            
                            if let name = station["stationName"] as? String {
                                
                                if let year = station["buildYear"] as? String {
                                    print(name,year)
                                }
                                
                            }
                        }
                        
                    }
                    
                }catch {
                    print("Error with Json: \(error)")
                }
                
            }
        }
        
        yolo(stuff)
*/
/*
        let requestURL: NSURL = NSURL(string: "http://www.learnswiftonline.com/Samples/subway.json")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        var json: [String?]
        do {
            json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions())
        } catch {
            print(error)
        }
        
        if let stations = json["stations"] as! String {
            
            for station in stations {
                
                if let name = station["stationName"] as? String {
            
                    if let year = station["buildYear"] as? String {
                        
                        print(name,year)
                    }
                }
            }
        
            
        }
*/
        
        
        
        
        
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


        
        
        
        
        
        
//        if let auth = GTMOAuth2ViewControllerTouch.authForGoogleFromKeychainForName(
//            kKeychainItemName,
//            clientID: kClientID,
//            clientSecret: nil) {
//           service.authorizer = auth
//        }
        
//        let downloadJSON = DownloadJSON()
//        events = downloadJSON.downloadAndParseJSON()

        
//        stations.append("first one")
//        stations.append("second one")
//        stations.append("third one")
        

        
        
        
        
        

    
    
    
    
/*    func downloadAndParseJSON() {
        let requestURL: NSURL = NSURL(string: "https://www.googleapis.com/calendar/v3/calendars/u5mgb2vlddfj70d7frf3r015h0@group.calendar.google.com/events?key=AIzaSyC_yZtpuIBpqT7PHKgzAPZrWIUGmOuccvI&maxResults=500000&timeMin=2016-06-03T10:00:00-07:00&showDeleted=false&singleEvents=true&orderBy=startTime")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest)
         
     
     
     
     
            {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                do{
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    
                    if let items = json["items"] as? [[String: AnyObject]] {
                        
                        for item in items {
                            let event : Event? = Event()
                            if let summary = item["summary"] as? String {
                                if let start = item["start"]!["date"] as? String {
                                    self.eventNames.append(summary)
                                    
                                    self.eventDates.append(start)
                                    print(self.events.count)
                                    
                                }
                                
                                event?.summary = summary
                                
                                
                                self.events.append(event!)
                                print("Woohoo")
                            }
                        }
                        
                    }
                    
                }catch {
                    print("Error with Json: \(error)")
                }
                
                
            }
        }
        
        task.resume()

    }
*/
    
    
    
    
    
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
        
        
        
//        let cell = tableView.dequeueReusableCellWithIdentifier("EventsViewCell", forIndexPath: indexPath) as! EventsViewCell
        
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


/*
        let cellIdentifier = "EventsViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventsViewCell
        
//        let event: Event
        
        cell.summary.text = "bla"
        
        return cell
        
    
        
*/
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
        
    

//
//    // When the view appears, ensure that the Google Calendar API service is authorized
//    // and perform API calls
//    
//    //this is how u display the stuff that shows the signin
//    override func viewDidAppear(animated: Bool) {
//        if let authorizer = service.authorizer,
//            canAuth = authorizer.canAuthorize where canAuth {
//            fetchEvents()
//        } else {
//            //code that presents the auth controller
//            presentViewController(
//                createAuthController(),
//                animated: true,
//                completion: nil
//            )
//        }
//    }
//    
//    // Construct a query and get a list of upcoming events from the user calendar
//    func fetchEvents() {
//        let query = GTLQueryCalendar.queryForEventsListWithCalendarId("primary")
//        query.maxResults = 10
//        query.timeMin = GTLDateTime(date: NSDate(), timeZone: NSTimeZone.localTimeZone())
//        query.singleEvents = true
//        query.orderBy = kGTLCalendarOrderByStartTime
//        service.executeQuery(
//            query,
//            delegate: self,
//            didFinishSelector: "displayResultWithTicket:finishedWithObject:error:"
//        )
//    }
//    
//    // Display the start dates and event summaries in the UITextView
//    func displayResultWithTicket(
//        ticket: GTLServiceTicket,
//        finishedWithObject response : GTLCalendarEvents,
//                           error : NSError?) {
//        
//        if let error = error {
//            showAlert("Error", message: error.localizedDescription)
//            return
//        }
//        
//        var eventString = ""
//        
//        if let events = response.items() where !events.isEmpty {
//            for event in events as! [GTLCalendarEvent] {
//                let start : GTLDateTime! = event.start.dateTime ?? event.start.date
//                let startString = NSDateFormatter.localizedStringFromDate(
//                    start.date,
//                    dateStyle: .ShortStyle,
//                    timeStyle: .ShortStyle
//                )
//                eventString += "\(startString) - \(event.summary)\n"
//            }
//        } else {
//            eventString = "No upcoming events found."
//        }
//        
//        output.text = eventString
//    }
//    
//    
//    // Creates the auth controller for authorizing access to Google Calendar API
//    private func createAuthController() -> GTMOAuth2ViewControllerTouch {
//        let scopeString = scopes.joinWithSeparator(" ")
//        return GTMOAuth2ViewControllerTouch(
//            scope: scopeString,
//            clientID: kClientID,
//            clientSecret: nil,
//            keychainItemName: kKeychainItemName,
//            delegate: self,
//            finishedSelector: "viewController:finishedWithAuth:error:"
//        )
//    }
//    
//    
//    // Handle completion of the authorization process, and update the Google Calendar API
//    // with the new credentials.
//    func viewController(vc : UIViewController,
//                        finishedWithAuth authResult : GTMOAuth2Authentication, error : NSError?) {
//        
//        if let error = error {
//            service.authorizer = nil
//            showAlert("Authentication Error", message: error.localizedDescription)
//            return
//        }
//        
//        service.authorizer = authResult
//        dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//    // Helper for showing an alert
//    func showAlert(title : String, message: String) {
//        let alert = UIAlertController(
//            title: title,
//            message: message,
//            preferredStyle: UIAlertControllerStyle.Alert
//        )
//        let ok = UIAlertAction(
//            title: "OK",
//            style: UIAlertActionStyle.Default,
//            handler: nil
//        )
//        alert.addAction(ok)
//        presentViewController(alert, animated: true, completion: nil)
//    }
//    
//    
//}
//



