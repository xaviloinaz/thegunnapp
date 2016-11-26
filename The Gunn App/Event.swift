//
//  Event.swift
//  TheGunnApp
//
//  Created by Xavi Loinaz on 7/17/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//


import Foundation
import UIKit

class Event{
    var startDate : String? = ""
    var endDate : String? = ""
    var startTime : String? = ""
    var endTime : String? = ""
    var summary : String? = ""
    var location : String? = ""
    var day : String! = ""
    var description : String? = ""
    
    
    func getStartDate() -> String? {
        return startDate
    }
    
    func getEndDate() -> String? {
        return endDate
    }
    
    func getStartTime() -> String? {
        return startTime
    }
    
    func getEndTime() -> String? {
        return endTime
    }
    
    func getSummary() -> String? {
        return summary
    }
    
    func getLocation() -> String? {
        return location
    }
    
    func getDay() -> String! {
        return day
    }
    
    func getDescription() -> String? {
        return description
    }
    
}
