//
//  StaffInfoViewController.swift
//  TheGunnApp
//
//  Created by Xavi Loinaz on 7/11/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

import UIKit
import MessageUI

class StaffInfoViewController: UIViewController {

    
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var department: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    var staffs = [Staff]()
    var thisStaff : Staff = Staff()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let instance = StaffTableViewController()
        
//        var staffs = instance.getStaffs()
        
//        var staff = staffs[indexPath.row]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
//        loadStaffList()
        
        teacherName.text = thisStaff.getName()
        position.text = thisStaff.getPosition()
        department.text = thisStaff.getDepartment()
        phoneNumber.text = thisStaff.getPhoneNumber()
        
        
    }

    @IBAction func emailTeacher() {
        let email = thisStaff.getEmail()
        let url = NSURL(string: "mailto:\(email)")
        UIApplication.sharedApplication().openURL(url!)
        
    }
    
    
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }

    
}
