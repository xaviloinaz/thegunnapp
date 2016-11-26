//
//  StudentID.swift
//  TheGunnApp
//
//  Created by Xavi Loinaz on 11/25/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

import Foundation
import UIKit

class StudentID : NSObject, NSCoding {
    
    var studentID
    var studentIDKey
    
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(studentID, forKey: studentIDKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let studID = aDecoder.decodeObjectForKey(studentIDKey) as! String
    }
    
}
