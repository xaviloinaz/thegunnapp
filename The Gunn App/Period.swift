//
//  Period.swift
//  TheGunnApp
//
//  Created by Xavi Loinaz on 7/24/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

import Foundation
import UIKit

class Period {
    
    
    var name : String
    var startTime : String
    var endTime : String
    
    init(name: String, startTime: String, endTime: String) {
        
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
        
    }
    
    func getName() -> String {
        return name
    }
    
    func getStartTime() -> String {
        return startTime
    }
    
    func getEndTime() -> String {
        return endTime
    }
    
    
}



