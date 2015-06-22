//
//  HomeViewController.swift
//  opt
//
//  Created by Quinton Wall on 6/18/15.
//  Copyright © 2015 Quinton Wall. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        settingsButton.layer.borderColor = UIColor.whiteColor().CGColor
    }

    
    @IBAction func settingsTapped(sender: AnyObject) {
        
    }
    
}