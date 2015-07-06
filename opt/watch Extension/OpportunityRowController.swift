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
    var amount: String!
    var closeDate: String!
    var stageName: String!
    var fiscal: String!
    var fiscalQuarter: String!
    var fiscalYear: String!
    
}

