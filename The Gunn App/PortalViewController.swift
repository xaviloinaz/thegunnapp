//
//  PortalViewController.swift
//  
//
//  Created by Xavi Loinaz on 6/28/16.
//
//

import Foundation
import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l >= r
  default:
    return !(lhs < rhs)
  }
}


class PortalViewController: UIViewController, UITextFieldDelegate {
    
    
    static var studID = ""

    
    var eight_characters = false
    @IBAction func goToPortal() {
        if let url = URL(string: "https://id.pausd.org/arms/m") {
            
            UIApplication.shared.openURL(url)
            
        }
    }
    var studentid: String = UserDefaults.standard.string(forKey: "mystudentid") ?? "" {
        didSet {
            UserDefaults.standard.setValue(studentid, forKey: "mystudentid")
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBOutlet weak var textbox: UITextField!
    @IBOutlet weak var barcode: UIImageView!
    @IBAction func myPAUSDButton() {
        if let url = URL(string: "https://id.pausd.org/arms/m") {
            
            UIApplication.shared.openURL(url)
            
        }
    }
    
    @IBAction func editingdidbegin(_ sender: UITextField) {
        print("editingdidbegin")
        if(textbox.text?.characters.count>=8){
            print("8 characters")
            eight_characters = true
        }
        else{
            eight_characters = false
        }
    }
    @IBAction func editingchanged(_ sender: UITextField) {
        print("editingchanged")
        

        if(textbox.text?.characters.count >= 8){
            print(textbox.text)
            // make sure it can only be editable until it's 8 characters
            let subStr = textbox.text?[(textbox.text?.characters.index((textbox.text?.startIndex)!, offsetBy: 0))!...(textbox.text?.characters.index((textbox.text?.startIndex)!, offsetBy: 7))!]
            textbox.text = subStr
            textFieldShouldReturn(textbox);
            barcode.image = generateBarcodeFromString(textbox.text!)
        }
    }
    @IBAction func valuechanged(_ sender: UITextField) {
        print("valuechanged")
    }

    

    @IBAction func editingdidend(_ sender: AnyObject) {
        print("editingdidend")
        studentid = textbox.text!
        barcode.image = generateBarcodeFromString(textbox.text!)
    }

    
    func generateBarcodeFromString(_ string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CICode128BarcodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.applying(transform) {
                return UIImage(ciImage: output)
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
        self.textbox.keyboardType = UIKeyboardType.numberPad;
        self.textbox.text = studentid;
        barcode.image = generateBarcodeFromString(textbox.text!)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("textfield")
        
        let aSet = CharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
        
    }

    
    
}
