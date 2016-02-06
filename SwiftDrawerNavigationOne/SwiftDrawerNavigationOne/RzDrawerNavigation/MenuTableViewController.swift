//
//  MenuTableViewController.swift
//  SwiftDrawerNavigationOne
//
//  Created by NextDot on 2/4/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    var menuItems = ["Home", "News", "Tech", "Finance", "Reviews"]
    var currentItem = "Home"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return menuItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MenuTableViewCell
        
        // Configure the cell...
        cell.titleLabel.text = menuItems[indexPath.row]
        cell.titleLabel.textColor = (menuItems[indexPath.row] == currentItem) ? UIColor.whiteColor() : UIColor.grayColor()
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let menuTableViewController = segue.sourceViewController as! MenuTableViewController
        if let selectedIndexPath = menuTableViewController.tableView.indexPathForSelectedRow {
            currentItem = menuItems[selectedIndexPath.row]
        }
    }
    
}