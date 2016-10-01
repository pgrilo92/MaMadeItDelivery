//
//  backEndMenu.swift
//  MaMadeItDelivery
//
//  Created by Joaquim Patrick Ramos Grilo on 2016-01-06.
//  Copyright © 2016 Parse. All rights reserved.
//

import Foundation
import Parse

class backEndMenu: UITableViewController {
    
    var tableArray = [String]()
    
    override func viewDidLoad() {
        
        
        tableArray = ["Account Settings", "Orders", "Promotions", "Recent Meals", "Logout"]
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableArray.count
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: tableArray[(indexPath as NSIndexPath).row], for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = tableArray[(indexPath as NSIndexPath).row]
        
        return cell
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "logout" {
            
            PFUser.logOut()
            print("logout successful")
            
        }
    }
    
    
}
