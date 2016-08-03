//
//  MapViewController.swift
//  TheGunnApp
//
//  Created by Xavi Loinaz on 7/13/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

import Foundation
import UIKit

class MapViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var gunnMap: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.barTintColor = UIColor.redColor()
        // Do any additional setup after loading the view, typically from a nib.
        self.scrollView.minimumZoomScale = 0.45
        self.scrollView.maximumZoomScale = 2.0
        self.scrollView.zoomScale = 0.45
        //scrollView.contentSize = CGSizeMake(view.frame.size.height, 1.0)
        scrollView.contentSize = CGSizeMake(scrollView.contentSize.width,scrollView.frame.size.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.gunnMap
    }
    

    
    
}
