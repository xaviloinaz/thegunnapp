//
//  DirectoryViewController.swift
//  The Gunn App
//
//  Created by Xavi Loinaz on 6/5/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

import Foundation
import UIKit

class DirectoryViewController: UITableViewController {
    
//    @IBOutlet weak var navigationBar: UINavigationItem!
    
    var staffs = [Staff]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController!.navigationBar.barTintColor = UIColor.redColor()
        staffs = [
            Staff(name:"Chocolate", department:"Chocolate Bar"),
            Staff(name:"Chocolate", department:"Chocolate Chip"),
            Staff(name:"Chocolate", department:"Dark Chocolate"),
            Staff(name:"Hard", department:"Lollipop"),
            Staff(name:"Hard", department:"Candy Cane"),
            Staff(name:"Hard", department:"Jaw Breaker"),
            Staff(name:"Other", department:"Caramel"),
            Staff(name:"Other", department:"Sour Chew"),
            Staff(name:"Other", department:"Gummi Bear")
        ]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Table view sutff
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return staffs.count
//    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let staff = staffs[indexPath.row]
        cell.textLabel!.text = staff.name
//        cell.detailTextLabel!.text = staff.category
        return cell
 
    }
 
 

}