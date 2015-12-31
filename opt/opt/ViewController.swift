//
//  ViewController.swift
//  opt
//
//  Created by Quinton Wall on 6/18/15.
//  Copyright © 2015 Quinton Wall. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SFAuthenticationManagerDelegate {

    @IBOutlet weak var connectButton: UIButton!

    
    override func viewWillAppear(animated: Bool) {
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SFAuthenticationManager.sharedManager().addDelegate(self)
        
        if SFAuthenticationManager.sharedManager().haveValidSession {
            print("VALID")
            dispatch_async(dispatch_get_main_queue()){
                
                self.performSegueWithIdentifier("loggedIn", sender: self)
                
            }
    }
        
        connectButton.backgroundColor = UIColor.clearColor()
        //connectButton.layer.cornerRadius = 5
        // connectButton.layer.borderWidth = 1
        connectButton.layer.borderColor = UIColor.whiteColor().CGColor
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func connectTapped(sender: AnyObject) {
     
        SalesforceSDKManager.sharedManager().launch()
        
    }
    
    
    func authManagerDidFinish(manager: SFAuthenticationManager!, info: SFOAuthInfo!) {
       
        //need to perform this check at the end of the authmanager lifecycle
        //because SFRootViewManager removes the current view after didAUthenticate gets called :(
       
        if SFAuthenticationManager.sharedManager().haveValidSession {
            
             self.performSegueWithIdentifier("loggedIn", sender: nil)
        }
    }
   
    
} //end class

