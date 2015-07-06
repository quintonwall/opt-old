//
//  OpportunityRowController.swift
//  opt
//
//  Created by Quinton Wall on 7/5/15.
//  Copyright © 2015 Quinton Wall. All rights reserved.
//

import Foundation
import WatchKit

class OpportunityRowController: NSObject {
    
    @IBOutlet var rowIcon: WKInterfaceImage!
    
    @IBOutlet var opportunityNameLabel: WKInterfaceLabel!
    
    var opportunityId: String!
    var name: String!
    var amount: Double!
    var closeDate: String!
    var stageName: String!
    var fiscal: String!
    var fiscalQuarter: Int!
    var fiscalYear: Int!
    
    
    func getFormattedCloseDate() -> String {
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.dateFromString(closeDate)
        
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        //formatter.timeStyle = .MediumStyle
        return formatter.stringFromDate((date)!)
    }
    
    func getAbbreviatedOpportunityAmount() -> String {
        return abbreviateNumber(amount) as String
    }
    
    func abbreviateNumber(num: NSNumber) -> NSString {
        var ret: NSString = ""
        let abbrve: [String] = ["K", "M", "B"]
        
        let floatNum = num.floatValue
        
        if floatNum > 1000 {
            
            for i in 0..<abbrve.count {
                let size = pow(10.0, (Float(i) + 1.0) * 3.0)
                print("\(size)   \(floatNum)")
                if (size <= floatNum) {
                    let num = floatNum / size
                    let str = floatToString(num)
                    ret = NSString(format: "%@%@", str, abbrve[i])
                }
            }
        } else {
            ret = NSString(format: "%d", Int(floatNum))
        }
        
        return ret
    }
    
    func floatToString(val: Float) -> NSString {
        var ret = NSString(format: "%.1f", val)
        var c = ret.characterAtIndex(ret.length - 1)
        
        while c == 48 {
            ret = ret.substringToIndex(ret.length - 1)
            c = ret.characterAtIndex(ret.length - 1)
            
            
            if (c == 46) {
                ret = ret.substringToIndex(ret.length - 1)
            }
        }
        return ret
    }

    
}

