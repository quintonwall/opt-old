//
//  OpportunityTableViewController.swift
//  opt
//
//  Created by Quinton Wall on 7/4/15.
//  Copyright © 2015 Quinton Wall. All rights reserved.
//

import Foundation
import WatchKit
import WatchConnectivity

class OpportunityTableViewController: WKInterfaceController, WCSessionDelegate {
    
    var session : WCSession!
    
    @IBOutlet var debugLabel: WKInterfaceLabel!
    @IBOutlet var optyTable: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }
    
    override func willActivate() {
        super.willActivate()
        
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
            
            let applicationData = ["request-type":"fetchall", "param1": false, "param2": 100000]
            
            
            if (WCSession.defaultSession().reachable) {
                session.sendMessage(applicationData, replyHandler: { reply in
                    //handle iphone response here
                    if(reply["success"] != nil) {
                        let a:AnyObject = reply["success"] as! NSDictionary
                        self.loadTableData(a as! NSDictionary)
                    }
                    
                }, errorHandler: {(error ) -> Void in
                    // catch any errors here
                })
            }
            
        }
        
    }
    
    private func loadTableData(results: NSDictionary) {
       //results come in 3 elements* "done"(bool), "totalSize"(nsnumber), and "records"(NSArray)
        
        let records:NSArray = results["records"] as! NSArray
        optyTable.setNumberOfRows(records.count, withRowType: "OptyRows")
        
        for (index, record) in records.enumerate() {
            let row = optyTable.rowControllerAtIndex(index) as! OpportunityRowController
            
            let s: NSDictionary = record as! NSDictionary
            
            row.opportunityNameLabel.setText(s["Name"] as? String)
           
            row.opportunityId = s["Id"] as? String
            row.name = s["Name"] as? String
            row.amount = s["Amount"] as? String
            row.closeDate = s["CloseDate"] as? String
            row.stageName = s["StageName"] as? String
            row.fiscal = s["Fiscal"] as? String
            row.fiscalQuarter = s["FiscalQuarter"] as? String
            row.fiscalYear = s["FiscalYear"] as? String

        }
    }

    
}