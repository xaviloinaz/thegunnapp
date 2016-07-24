//
//  DownloadJSON.swift
//  TheGunnApp
//
//  Created by Xavi Loinaz on 7/17/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

import Foundation
import UIKit

extension String {
    subscript(integerIndex: Int) -> Character {
        let index = startIndex.advancedBy(integerIndex)
        return self[index]
    }
    
    subscript(integerRange: Range<Int>) -> String {
        let start = startIndex.advancedBy(integerRange.startIndex)
        let end = startIndex.advancedBy(integerRange.endIndex)
        let range = start..<end
        return self[range]
    }
}

class DownloadJSON {
    
    var events = [Event]()
    
    
    
    func dateString(date:String?) -> String{
//        var date = Array(arrayLiteral: str!)
        var year = date![0...3]
        var month = date![5...6]
        var day = date![8...9]
        var datestr = ""
        datestr += month
        datestr += "/"
        datestr += day
        datestr += "/" + year;
        
        return datestr
        
    }
    
    func timeString(date: String?) -> String{
        
        
        
    }
    
    
    func downloadAndParseJSON()-> [Event]{
        let eventsURL: NSURL = [#FileReference(fileReferenceLiteral: "events.json")#]
        let data = NSData(contentsOfURL: eventsURL)!
        
        
        
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            
            if let events = json["items"] as? [[String: AnyObject]] {
                for event in events {
                    var eve : Event? = Event()
                    if let startDate = event["start"]!["date"]! as? String {
                        eve!.startDate = startDate
                    }
                    if let endDate = event["end"]!["date"]! as? String {
                        eve!.endDate = endDate
                    }
                    if let startTime = event["start"]!["dateTime"]! as? String {
                        eve!.startTime = startTime
                    }
                    if let endTime = event["end"]!["dateTime"]! as? String {
                        eve!.endTime = endTime
                    }
                    if let summary = event["summary"] as? String {
                        eve!.summary = summary
                    }
                    if let location = event["location"] as? String {
                        eve!.location = location
                    }
                    self.events.append(eve!)
                }
            }
        } catch {
            print("error serializing JSON: \(error)")
        }
        print (events.count)
        
        return events
    
        
    }
    
    
    
    
    
    
    

//func downloadAndParseJSON() -> [Event] {
//    let requestURL: NSURL = NSURL(string: "https://www.googleapis.com/calendar/v3/calendars/u5mgb2vlddfj70d7frf3r015h0@group.calendar.google.com/events?key=AIzaSyC_yZtpuIBpqT7PHKgzAPZrWIUGmOuccvI&maxResults=5000000&timeMin=2016-06-03T10:00:00-07:00&showDeleted=false&singleEvents=true&orderBy=startTime")!
//    let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
//    let session = NSURLSession.sharedSession()
//    let task = session.dataTaskWithRequest(urlRequest) {
//        (data, response, error) -> Void in
//        
//        let httpResponse = response as! NSHTTPURLResponse
//        let statusCode = httpResponse.statusCode
//        
//        if (statusCode == 200) {
//            print("Everyone is fine, file downloaded successfully.")
//            
//            do{
//                
//                let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
//                
//                if let items = json["items"] as? [[String: AnyObject]] {
//                    
//                    for item in items {
//                        var event : Event? = Event()
//                        if let summary = item["summary"] as? String {
//                            if let start = item["start"]!["date"] as? String {
//                                
//                                print(self.events.count)
//                                
//                            }
//                            
//                            event?.summary = summary
//                            
//                            self.events.append(event!)
//                        }
//                    }
//                    
//                }
//                
//            }catch {
//                print("Error with Json: \(error)")
//            }
//            
//            
//        }
//    }
//    
//    task.resume()
//    return events
//}

}