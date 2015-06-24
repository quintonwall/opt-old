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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        SFAuthenticationManager.sharedManager().addDelegate(self)

        
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
        
        //todo - move this into the authManager call back
        //but I couldnt get it to work!
        
    }
    
    
    
    func authManagerDidFinish(manager: SFAuthenticationManager!, info: SFOAuthInfo!) {
       
        //need to perform this check at the end of the authmanager lifecycle
        //because SFRootViewManager removes the current view after didAUthenticate gets called :(
       
        if !SFUserAccountManager.sharedInstance().currentUser.userName.isEmpty {
            
           
            /* old watchos way of comms
            print(appGroupID)
            
            
            if let defaults = NSUserDefaults(suiteName: appGroupID) {
                defaults.setValue(SFUserAccountManager.sharedInstance().currentUser.userName, forKey: "username")
                defaults.synchronize()
            }
            */
            
             self.performSegueWithIdentifier("loggedIn", sender: nil)
        }
    }
   
    
} //end class

