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

    
    
    
    @IBAction func goToPortal() {
        if let url = URL(string: "https://id.pausd.org/arms/m") {
            
            UIApplication.shared.openURL(url)
            
        }
    }

    
    
    
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var gunnMap: UIImageView!
    
    override func viewDidLoad() {
        let specialColor = UIColor(red: 255.0/255.0, green: 14.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        navigationController!.navigationBar.barTintColor = specialColor
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.scrollView.minimumZoomScale = 0.45
        self.scrollView.maximumZoomScale = 1.7
        self.scrollView.zoomScale = 0.45
        //scrollView.contentSize = CGSizeMake(view.frame.size.height, 1.0)
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width,height: scrollView.frame.size.height)
        scrollView.contentInset = UIEdgeInsets.zero
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.gunnMap
    }
    
    fileprivate func updateMinZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width * 0.51 / gunnMap.bounds.width//size.width * 0.83 / gunnMap.bounds.width
        let heightScale = size.height * 0.51 / gunnMap.bounds.height//size.height * 0.83 / gunnMap.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        
        scrollView.zoomScale = minScale
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateMinZoomScaleForSize(view.bounds.size)
    }

    
    
}
