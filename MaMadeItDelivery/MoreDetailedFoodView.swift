//
//  MoreDetailedFoodView.swift
//  MaMadeItDelivery
//
//  Created by Joaquim Patrick Ramos Grilo on 2016-01-06.
//  Copyright © 2016 Parse. All rights reserved.
//


import UIKit
import Parse

class MoreDetailedFoodView: UIViewController {
    
    
    @IBOutlet var textLabel: UILabel!
    var varView = Int()
    
    override func viewDidLoad() {
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        if(varView == 0){
            
            textLabel.text = "string"
            
            
        } else {
            textLabel.text = "others"
        }
        
    }
    
    
    
}
