//
//  EventsViewController.swift
//  The Gunn App
//
//  Created by Xavi Loinaz on 6/5/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController!.navigationBar.barTintColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

