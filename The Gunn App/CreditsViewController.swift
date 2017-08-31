//
//  CreditsViewController.swift
//  TheGunnApp
//
//  Created by Xavi Loinaz on 9/4/16.
//  Copyright © 2016 Xavi Loinaz. All rights reserved.
//

import Foundation
// import GoogleAPIClient
// import GTMOAuth2
import UIKit



class CreditsViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBAction func goToFeedbackForm(_ sender: AnyObject) {
        
        if let url = URL(string: "https://goo.gl/forms/NGqZu00ESpfhnoWh1") {
            
            UIApplication.shared.openURL(url)
            
        }
        
    }
    
    @IBAction func goToSignupForm(_ sender: AnyObject) {
        
        if let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSe2baQCCdae4wRRQacNBd3xeDn3keRhNqG7i2S3-8xG8L5nnw/viewform?usp=send_form") {
            
            UIApplication.shared.openURL(url)
            
        }
        
    }
}
