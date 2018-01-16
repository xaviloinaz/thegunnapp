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
    var website : String?
    
    
    init() {
        self.name = ""
        self.position = ""
        self.department = ""
        self.phoneNumber = ""
        self.email = ""
    }
    
    init(name: String, position: String, department: String, phoneNumber : String, email: String) {
        self.name = name
        self.position = position
        self.department = department
        self.phoneNumber = phoneNumber
        self.email = email
    }
    
    init(name: String, position: String, department: String, phoneNumber : String, email: String, website: String?) {
        self.name = name
        self.position = position
        self.department = department
        self.phoneNumber = phoneNumber
        self.email = email
        self.website = website
    }
    
    func getName() -> String {
        return name
    }
    
    func getPosition() -> String {
        return position
    }
    
    func getDepartment() -> String {
        return department
    }
    
    func getPhoneNumber() -> String {
        return phoneNumber
    }
    
    func getEmail() -> String {
        return email
    }
    
    func getWebsite() -> String? {
/*        if let retVal = website{
            return retVal
        } else {
            return nil
        }
*/  return website
    }
    
}
