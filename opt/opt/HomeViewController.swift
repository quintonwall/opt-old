//
//  HomeViewController.swift
//  opt
//
//  Created by Quinton Wall on 6/18/15.
//  Copyright © 2015 Quinton Wall. All rights reserved.
//

import Foundation
import UIKit
import WatchConnectivity

class HomeViewController: UIViewController, WCSessionDelegate {
    
    @IBOutlet weak var settingsButton: UIButton!
    
     var session: WCSession!
    
    
    @IBOutlet weak var tempLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        settingsButton.layer.borderColor = UIColor.whiteColor().CGColor
    
        
        /*
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self;
            session.activateSession()
        }
*/
        
        //SEND A MESSAGE TO THE WATCH TO WELCOME LOGGED IN USER
        
      //  let applicationData = ["username":SFUserAccountManager.sharedInstance().currentUser.userName]
        
        //EXAMPLE OF SENDING DATA TO PHONE
      //  session.sendMessage(applicationData, replyHandler: {([String : AnyObject]) -> Void in
            // handle reply from watch app here
        //    }, errorHandler: {(error ) -> Void in
                // catch any errors here
      //  })


       // var userDict = [String: String]()
        //userDict["username"] = SFUserAccountManager.sharedInstance().currentUser.userName
        
    }

    
    @IBAction func settingsTapped(sender: AnyObject) {
        
    }
    
    
    /*
    
    //receive a message from the watch
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        let val = message["fromwatch"] as? String
        print("received a message")
        
         dispatch_async(dispatch_get_main_queue()) {
           self.tempLabel.text = val
        }
    }
*/

    
}