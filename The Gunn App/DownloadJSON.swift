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
    
    
    
    func intToDayString(day: Int?) -> String? {
        if(day! == 1){
            return "Sunday"
        }
        if(day! == 2){
            return "Monday"
        }
        if(day! == 3){
            return "Tuesday"
        }
        if(day! == 4){
            return "Wednesday"
        }
        if(day! == 5){
            return "Thursday"
        }
        if(day! == 6){
            return "Friday"
        }
        if(day! == 7){
            return "Saturday"
        }
        return ""
    }
    
    func getDayOfWeek(today:String)->Int? {
        
        let formatter  = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let todayDate = formatter.dateFromString(today) {
            let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let myComponents = myCalendar.components(.Weekday, fromDate: todayDate)
            let weekDay = myComponents.weekday
            return weekDay
        } else {
            return nil
        }
    }
    
    func dateString(str:String?) -> String{
        var datestr = ""
        if(str!.characters.count > 9){
//            print(str!.characters.count)
            let year = str![0...3]
            let month = str![5...6]
            let day = str![8...9]
            
//            datestr += month + "/" + day + "/" + year
            var week = year + "-" + month + "-" + day
            var dayNum = getDayOfWeek(week)!
            datestr = intToDayString(dayNum)! + ", " + month + "/" + day + "/" + year
        }
        
        
        return datestr
    }
    
    func yearString(str:String?) -> String{
        var result = ""
        if(str!.characters.count > 9){
            
            //            print(str!.characters.count)
            let year = str![0...3]
            result = year
        }
        return result
    }
    func monthString(str:String?) -> String{
        var result = ""
        if(str!.characters.count > 9){
            let month = str![5...6]
            result = month
        }
        return result
    }
    func dayString(str:String?) -> String{
        var result = ""
        if(str!.characters.count > 9){
            let day = str![8...9]
            result = day
        }
        return result
    }
    
    
    func timeString(str: String?) -> String{
        var time = ""
        if(str!.characters.count > 9){
            time += str![11...15]
            
            if(Int(time[0...1]) > 12){
                time = String(Int(time[0...1])!-12) + time[2...4] + " PM"
            }
            else{
                time += " AM"
            }
            if (time[0] == "0"){
                time = time[1...time.characters.count-1]
            }
            
            
        }
        
        
        return time
        
    }
    let date = NSDate()
    let calendar = NSCalendar.currentCalendar()
    func laterThanToday(str1: String?) -> Bool {
       
        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        
        let curYear = components.year
        let curMonth = components.month
        let curDay = components.day
        if(Int(yearString(str1)) > curYear){
            return true
        }
        else if(Int(yearString(str1)) == curYear){
            if(Int(monthString(str1)) > curMonth){
                return true
            }
            else if(Int(monthString(str1)) == curMonth){
                if(Int(dayString(str1)) > curDay){
                    return true
                }
            }
        }
//        print(curMonth + curDay + curYear)
        return false
    }
    
    
    func downloadAndParseJSON()-> [Event]{
        let eventsURL: NSURL = [#FileReference(fileReferenceLiteral: "events.json")#]
        let data = NSData(contentsOfURL: eventsURL)!
        
        
        
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            
            if let events = json["items"] as? [[String: AnyObject]] {
                for event in events {
                    let eve : Event? = Event()
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
                    if let description = event["description"] as? String {
                        eve!.description = description
                    }
                    
                    if(eve!.startTime! != ""){
                        if(laterThanToday(eve!.startTime!)){
                            self.events.append(eve!)
                        }
                    }
                    else if(eve!.startDate != ""){
                        if(laterThanToday(eve!.startDate!)){
                            self.events.append(eve!)
                        }
                    }
                    
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