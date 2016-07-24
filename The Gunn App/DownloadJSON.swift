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
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = startIndex.advancedBy(r.startIndex)
        let end = start.advancedBy(r.endIndex - r.startIndex)
        return self[Range(start ..< end)]
    }
}


class DownloadJSON {
    
    var events = [Event]()
    
    
    
    func dateString(str:String?) -> String{
        var datestr = ""
        if(str!.characters.count > 24){
//            print(str!.characters.count)
            let year = str![0...3]
            let month = str![5...6]
            let day = str![8...9]
            
            datestr += month + "/" + day + "/" + year
        
        }
        
        return datestr
    }
    
    func timeString(date: String?) -> String{
//        let time = date![11...15]
        let time = date![11...15]
        return time
        
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