//
//  MainTableCell.swift
//  MaMadeItDelivery
//
//  Created by Joaquim Patrick Ramos Grilo on 2016-01-06.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class MainTableCell: UITableViewCell {
    
    
    @IBOutlet var foodImage: UIImageView!
    
    
   
    @IBOutlet var profileImage: UIImageView!
    
    
    
    
    @IBOutlet var foodTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
