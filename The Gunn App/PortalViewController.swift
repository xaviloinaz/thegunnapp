//
//  PortalViewController.swift
//  
//
//  Created by Xavi Loinaz on 6/28/16.
//
//

import Foundation
import UIKit

class PortalViewController: UIViewController {
    
    @IBAction func myPAUSDButton() {
        if let url = NSURL(string: "https://id.pausd.org/arms/p/applications/my") {
            
            UIApplication.sharedApplication().openURL(url)
            
        }
    }
    
    
    override func viewDidLoad() {
        var specialColor = UIColor(red: 255.0/255.0, green: 14.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        navigationController!.navigationBar.barTintColor = specialColor
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

