//
//  DownloadJSON.swift
//  TheGunnApp
//
//  Created by Xavi Loinaz on 7/17/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

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
    
    
    
    
    
    
    
    func dateString(date:String?) -> String{
        
        //        var date = Array(arrayLiteral: str!)
        
        let year = date![0...3]
        
        let month = date![5...6]
        
        let day = date![8...9]
        
        var datestr = ""
        
        datestr += month
        
        datestr += "/"
        
        datestr += day
        
        datestr += "/" + year;
        
        
        
        
        
        
        
        return datestr
        
        
        
    }
    
    
    
    func timeString(date: String?) -> String{
        
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
}
