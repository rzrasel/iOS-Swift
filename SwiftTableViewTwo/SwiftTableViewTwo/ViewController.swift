//
//  ViewController.swift
//  SwiftTableViewTwo
//
//  Created by NextDot on 2/4/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var tabDataList: [String] = ["Rz Rasel", "Test Data One", "Test Data Two", "Test Data Three"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Rz Table View"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabDataList.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tabCellToReturn = tableView.dequeueReusableCellWithIdentifier("rzTableCell", forIndexPath: indexPath) as! RzTableViewCell
        tabCellToReturn.sysTabDataLabel.text = tabDataList[indexPath.row]
        return tabCellToReturn
    }
}