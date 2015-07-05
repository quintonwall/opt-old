//
//  OpportunityHelper.swift
//  opt
//
//  Created by Quinton Wall on 7/4/15.
//  Copyright © 2015 Quinton Wall. All rights reserved.
//

import Foundation
import WatchConnectivity


class OpportunityHelper: NSObject, WCSessionDelegate {
    
     var session: WCSession!
    
    func register() {
        
        print("Opportunity Helper registering for WatchKit sessions")
        
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self;
            session.activateSession()
            //let opty = Opportunity(name: "fred", amount: 100, status: "open")
            //let opty = Opportunity()
            //opty.name = "fred"
            //opty.amount = 100
            
        }
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
       // let val = message["fromwatch"] as? String
        replyHandler(["response": "100"])
       // dispatch_async(dispatch_get_main_queue()) {
         //   self.tempLabel.text = val
        //}
    }

    
    
}