//
//  ViewController.swift
//  SwiftTableHeaderOne
//
//  Created by NextDot on 2/11/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    //|------------------------------------|
    var repositories: [Repository] = [Repository]()
    //|------------------------------------|
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func viewDidLoad() {
        //|------------------------------------|
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //|------------------------------------|
        repositories.append(Repository(argName: "Rz Rasel", argAge: 28))
        repositories.append(Repository(argName: "Md. Rashed - Uz - Zaman", argAge: 28))
        repositories.append(Repository(argName: "Abner", argAge: 29))
        repositories.append(Repository(argName: "Alistair", argAge: 22))
        repositories.append(Repository(argName: "Eamon", argAge: 18))
        
        repositories.append(Repository(argName: "Edmond", argAge: 30))
        repositories.append(Repository(argName: "Edmund", argAge: 32))
        repositories.append(Repository(argName: "Enoch", argAge: 42))
        repositories.append(Repository(argName: "Rupert", argAge: 46))
        repositories.append(Repository(argName: "Remus", argAge: 50))
        //|------------------------------------|
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCellWithIdentifier("cellHeader") as! RzTableViewCell
        headerCell.backgroundColor = UIColor.cyanColor()
        let darkGrey = UIColor(hexString: "#757575")
        headerCell.backgroundColor = darkGrey
        
        switch (section) {
        case 0:
            headerCell.sysLblHeadName.text = "NAME";
            headerCell.sysLblHeadAge.text = "AGE";
            //return sectionHeaderView
        case 1:
            headerCell.sysLblHeadName.text = "NAME";
            //return sectionHeaderView
        case 2:
            headerCell.sysLblHeadName.text = "NAME";
            //return sectionHeaderView
        default:
            headerCell.sysLblHeadName.text = "OTHER";
        }
        return headerCell
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tabCellToReturn = tableView.dequeueReusableCellWithIdentifier("cellContent", forIndexPath: indexPath) as! RzTableViewCell
        //|------------------------------------|
        //tabCellToReturn.separatorInset.right = tabCellToReturn.separatorInset.left
        tabCellToReturn.layoutMargins = UIEdgeInsetsZero;
        tabCellToReturn.preservesSuperviewLayoutMargins = false
        //|------------------------------------|
        tabCellToReturn.sysLblContentName.text = repositories[indexPath.row].name
        let ageVal = repositories[indexPath.row].age
        tabCellToReturn.sysLblContentAge.text = ageVal!.toString()
        return tabCellToReturn
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row % 2 == 0
        {
            cell.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0) // very light gray
        }
        else
        {
            cell.backgroundColor = UIColor.whiteColor()
        }
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!) as! RzTableViewCell
        print("Name:- " + currentCell.sysLblContentName.text! + ", Age:- " + currentCell.sysLblContentAge.text!)
    }    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
}
//|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
extension UIColor {
    //|------------------------------------|
    convenience init(hexString: String) {
        //|------------------------------------|
        let hex = hexString.stringByTrimmingCharactersInSet(NSCharacterSet.alphanumericCharacterSet().invertedSet)
        var int = UInt32()
        NSScanner(string: hex).scanHexInt(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
        //|------------------------------------|
    }
    //|------------------------------------|
}
//|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
extension Int
{
    func toString() -> String
    {
        let intToStr = String(self)
        return intToStr
    }
}
//|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
class Repository {
    var name: String?
    var age: Int?
    
    init(argName: String, argAge: Int) {
        self.name = argName
        self.age = argAge
    }
    init(json: NSDictionary) {
        self.name = json["name"] as? String
        self.age = json["description"] as? Int
    }
}
//|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

