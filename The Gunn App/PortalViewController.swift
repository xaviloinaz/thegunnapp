//
//  PortalViewController.swift
//  
//
//  Created by Xavi Loinaz on 6/28/16.
//
//

import Foundation
import UIKit

class PortalViewController: UIViewController, UITextFieldDelegate {
    
    

    
    
    @IBAction func goToPortal() {
        if let url = NSURL(string: "https://id.pausd.org/arms/m") {
            
            UIApplication.sharedApplication().openURL(url)
            
        }
    }
    
    
    @IBOutlet weak var textbox: UITextField!
    @IBOutlet weak var barcode: UIImageView!
    @IBAction func myPAUSDButton() {
        if let url = NSURL(string: "https://id.pausd.org/arms/m") {
            
            UIApplication.sharedApplication().openURL(url)
            
        }
    }
    
    @IBAction func editingchanged(sender: UITextField) {
        print("editingchanged")
        if(textbox.text?.characters.count >= 8){
            print(textbox.text)
            textFieldShouldReturn(textbox);
            barcode.image = generateBarcodeFromString(textbox.text!)
        }
    }
    @IBAction func valuechanged(sender: UITextField) {
        print("valuechanged")
    }

    

    @IBAction func editingdidend(sender: AnyObject) {
        print("editingdidend")
        barcode.image = generateBarcodeFromString(textbox.text!)
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
        let specialColor = UIColor(red: 255.0/255.0, green: 14.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        navigationController!.navigationBar.barTintColor = specialColor
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        barcode.image = generateBarcodeFromString("95016633");
        self.textbox.delegate = self;
        self.textbox.keyboardType = UIKeyboardType.NumberPad;

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("textfield")
        
        let aSet = NSCharacterSet(charactersInString:"0123456789").invertedSet
        let compSepByCharInSet = string.componentsSeparatedByCharactersInSet(aSet)
        let numberFiltered = compSepByCharInSet.joinWithSeparator("")
        return string == numberFiltered
        
    }

    
    
}
