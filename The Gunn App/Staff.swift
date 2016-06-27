//
//  Staff.swift
//  TheGunnApp
//
//  Created by Xavi Loinaz on 6/19/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

import Foundation

class Staff {
    
    var name : String
    var position: String
    var department : String
    var phoneNumber : String
    var email : String
//    var website : String?
    
    
    init(name: String, position: String, department: String, phoneNumber : String, email: String) {
        self.name = name
        self.position = position
        self.department = department
        self.phoneNumber = phoneNumber
        self.email = email
    }
    
}