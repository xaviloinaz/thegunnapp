//
//  CreditsViewController.swift
//  TheGunnApp
//
//  Created by Xavi Loinaz on 9/4/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

import Foundation
import GoogleAPIClient
import GTMOAuth2
import UIKit



class CreditsViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBAction func goToFeedbackForm(sender: AnyObject) {
        
        if let url = NSURL(string: "https://goo.gl/forms/NGqZu00ESpfhnoWh1") {
            
            UIApplication.sharedApplication().openURL(url)
            
        }
        
    }
    
    @IBAction func goToSignupForm(sender: AnyObject) {
        
        if let url = NSURL(string: "https://docs.google.com/forms/d/e/1FAIpQLSe2baQCCdae4wRRQacNBd3xeDn3keRhNqG7i2S3-8xG8L5nnw/viewform?usp=send_form") {
            
            UIApplication.sharedApplication().openURL(url)
            
        }
        
    }
}