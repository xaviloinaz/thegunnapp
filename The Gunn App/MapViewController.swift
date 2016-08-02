//
//  MapViewController.swift
//  TheGunnApp
//
//  Created by Xavi Loinaz on 7/13/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

import Foundation
import UIKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapImage: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var mapLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var mapTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var mapBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var mapTopConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.barTintColor = UIColor.redColor()
        mapImage.image = UIImage(named: "Gunn Campus Map 09-27-15")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func updateMinZoomScaleForSize(size: CGSize) {
        let widthScale = size.width / mapImage.bounds.width
        let heightScale = size.height / mapImage.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = 1.0
        
        scrollView.zoomScale = 10.0
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateMinZoomScaleForSize(view.bounds.size)
    }
}

extension MapViewController: UIScrollViewDelegate {
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return mapImage
    }
}