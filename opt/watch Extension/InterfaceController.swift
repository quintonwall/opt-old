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

    @IBOutlet var optyNameLabel: WKInterfaceLabel!
    @IBOutlet var optyAmountLabel: WKInterfaceLabel!
    @IBOutlet var optyAmountIndicatorLabel: WKInterfaceLabel!
    @IBOutlet var optyStageButton: WKInterfaceButton!
    @IBOutlet var optyDateLabel: WKInterfaceLabel!
    @IBOutlet var optyStageLabel: WKInterfaceLabel!
    
    var session : WCSession!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }
    
    override func willActivate() {
        super.willActivate()
        
        
    }
    
       
    /*
    @IBAction func refreshTapped() {
        
        let applicationData = ["opportunities":"fetchall"]
        
        //EXAMPLE OF SENDING DATA TO PHONE
        session.sendMessage(applicationData, replyHandler: {([String : AnyObject]) -> Void in
            // handle reply from iPhone app here
            }, errorHandler: {(error ) -> Void in
                // catch any errors here
        })
        
    }
*/
  
    
    /*
    //EXAMPLE OF RECEIVING A MESSAGE FROM PHONE
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
       print("got a message in recv")
        let val = message["username"] as? String
        self.optyNameLabel.setText("response-start")
        //Use this to update the UI instantaneously (otherwise, takes a little while)
       dispatch_async(dispatch_get_main_queue()) {
            self.optyNameLabel.setText("response-thread")
        }
    }
*/


    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
        //TODO: dump all opportunities
    }

}
