//
//  OpportunityHelper.swift
//  opt
//
//  Created by Quinton Wall on 7/4/15.
//  Copyright © 2015 Quinton Wall. All rights reserved.
//

import Foundation
import WatchConnectivity


class OpportunityHelper: NSObject, WCSessionDelegate, SFRestDelegate {
    
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
       print("heard a request")
       //make sure we are logged in
        if( SFUserAccountManager.sharedInstance().currentUser == nil) {
             print("not logged in")
             replyHandler(["error": "not logged in"])
        } else {
        
             print("prep request")
            let reqType = message["request-type"] as! String
            
            let sharedInstance = SFRestAPI.sharedInstance()
            
            if(reqType == "fetchall") {
                
                let nextQtr = message["param1"] as! Bool
                let maxAmt = message["param2"] as! Int
                
                let query = getAllOpportunitiesQuery(self, nextQuarter: nextQtr, maxOpportunityAmount: maxAmt)
                
                sharedInstance.performSOQLQuery(query, failBlock: { error in
                    replyHandler(["error": error])
                    }) { response in  //success
                        print("sending successful response")
                        replyHandler(["success": response])
                }
                
            } else {
                replyHandler(["error": "no such request-type: "+reqType])
            }
        }
        
        
        
        
        
    }


    
    //Salesforce Mobile SDK calls
    
    func getAllOpportunitiesQuery(delegate: SFRestDelegate, nextQuarter: Bool, maxOpportunityAmount: Int) -> String{
        
        var quarter = "THIS_QUARTER"
        if(nextQuarter) {
            quarter = "NEXT_QUARTER"
        }
       
        
       return "SELECT Id, Name, Amount, CloseDate, StageName, Fiscal, FiscalQuarter, FiscalYear FROM Opportunity WHERE Amount <= "+String(maxOpportunityAmount)+" and CloseDate =  "+quarter+" order by CloseDate"
        
        
    }
    
    
}