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
        super.viewDidLoad()
        navigationController!.navigationBar.barTintColor = UIColor.redColor()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController!.navigationBar.barTintColor = UIColor.redColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

