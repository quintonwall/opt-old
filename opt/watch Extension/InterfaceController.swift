//
//  InterfaceController.swift
//  watch Extension
//
//  Created by Quinton Wall on 6/23/15.
//  Copyright © 2015 Quinton Wall. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity



class InterfaceController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet var refreshButton: WKInterfaceButton!
    @IBOutlet var statusLabel: WKInterfaceLabel!
    
    var session : WCSession!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }
    
    override func willActivate() {
        super.willActivate()
        
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    }
    
    @IBAction func refreshTapped() {
        
        let applicationData = ["fromwatch":"I am alive!"]
        
        //EXAMPLE OF SENDING DATA TO PHONE
        session.sendMessage(applicationData, replyHandler: {([String : AnyObject]) -> Void in
            // handle reply from iPhone app here
            }, errorHandler: {(error ) -> Void in
                // catch any errors here
        })
        
    }
    
    //EXAMPLE OF RECEIVING A MESSAGE FROM PHONE
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        let val = message["username"] as? String
        
        //Use this to update the UI instantaneously (otherwise, takes a little while)
        dispatch_async(dispatch_get_main_queue()) {
            self.statusLabel.setText(val)
        }
    }


    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
