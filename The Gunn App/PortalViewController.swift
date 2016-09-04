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
    
    @IBOutlet weak var barcode: UIImageView!
    @IBAction func myPAUSDButton() {
        if let url = NSURL(string: "https://id.pausd.org/arms/m") {
            
            UIApplication.sharedApplication().openURL(url)
            
        }
    }
    func generateBarcodeFromString(string: String) -> UIImage? {
        let data = string.dataUsingEncoding(NSASCIIStringEncoding)
        
        if let filter = CIFilter(name: "CICode128BarcodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransformMakeScale(3, 3)
            
            if let output = filter.outputImage?.imageByApplyingTransform(transform) {
                return UIImage(CIImage: output)
            }
        }
        
        return nil
    }
    
    
//    barcode.image = image;
    override func viewDidLoad() {
        var specialColor = UIColor(red: 255.0/255.0, green: 14.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        navigationController!.navigationBar.barTintColor = specialColor
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        barcode.image = generateBarcodeFromString("95016633");

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

