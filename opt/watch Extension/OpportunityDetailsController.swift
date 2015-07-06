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




class OpportunityDetailsController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet var optyNameLabel: WKInterfaceLabel!
    @IBOutlet var optyAmountLabel: WKInterfaceLabel!
    @IBOutlet var optyAmountIndicatorLabel: WKInterfaceLabel!
    @IBOutlet var optyStageButton: WKInterfaceButton!
    @IBOutlet var optyDateLabel: WKInterfaceLabel!
    @IBOutlet var optyStageLabel: WKInterfaceLabel!
    
    var session : WCSession!
    var opty: OpportunityRowController!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let opty = context as? OpportunityRowController {
            self.opty = opty
            setTitle(opty.name)
            bindToInterface(opty)
        }
        
    }
    
    override func willActivate() {
        super.willActivate()
        
        
    }
    
    private func bindToInterface(o: OpportunityRowController) {
        optyNameLabel.setText(o.name)
        //todo: math function to div into millions,billions and set amount indicator
        optyAmountLabel.setText(o.getAbbreviatedOpportunityAmount())
        optyStageLabel.setText(o.stageName)
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        //formatter.timeStyle = .MediumStyle
        optyDateLabel.setText(o.getFormattedCloseDate())
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
