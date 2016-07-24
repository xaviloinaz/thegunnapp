//
//  DownloadJSON.swift
//  TheGunnApp
//
//  Created by Xavi Loinaz on 7/17/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

import Foundation
import UIKit

class DownloadJSON {
    

    var events = [Event]()
    
    

func downloadAndParseJSON() -> [Event] {
    let requestURL: NSURL = NSURL(string: "https://www.googleapis.com/calendar/v3/calendars/u5mgb2vlddfj70d7frf3r015h0@group.calendar.google.com/events?key=AIzaSyC_yZtpuIBpqT7PHKgzAPZrWIUGmOuccvI&maxResults=5000000&timeMin=2016-06-03T10:00:00-07:00&showDeleted=false&singleEvents=true&orderBy=startTime")!
    let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
    let session = NSURLSession.sharedSession()
    let task = session.dataTaskWithRequest(urlRequest) {
        (data, response, error) -> Void in
        
        let httpResponse = response as! NSHTTPURLResponse
        let statusCode = httpResponse.statusCode
        
        if (statusCode == 200) {
            print("Everyone is fine, file downloaded successfully.")
            
            do{
                
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                
                if let items = json["items"] as? [[String: AnyObject]] {
                    
                    for item in items {
                        var event : Event? = Event()
                        if let summary = item["summary"] as? String {
                            if let start = item["start"]!["date"] as? String {
                                
                                print(self.events.count)
                                
                            }
                            
                            event?.summary = summary
                            
                            self.events.append(event!)
                        }
                    }
                    
                }
                
            }catch {
                print("Error with Json: \(error)")
            }
            
            
        }
    }
    
    task.resume()
    return events
}

}