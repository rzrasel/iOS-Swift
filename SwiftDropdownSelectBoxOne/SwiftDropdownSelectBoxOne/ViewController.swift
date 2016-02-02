//
//  ViewController.swift
//  SwiftDropdownSelectBoxOne
//
//  Created by NextDot on 2/2/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let dropDownCtrlOne = DropDownSelectBox();
    @IBOutlet var sysDropdownHolderOne: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        sysDropdownHolderOne.layer.borderWidth = 1.0
        sysDropdownHolderOne.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        sysDropdownHolderOne.layer.cornerRadius = cornerRadius
        sysDropdownHolderOne.titleEdgeInsets.left = 10
        
        dropDownCtrlOne.dataSource = [
            "Car",
            "Motorcycle",
            "Van",
            "Truck",
            "Bus",
            "Bicycle",
            "Feet",
            "Animal",
            "Dog",
            "Cat",
            "Bitch",
            "Animal",
            "Dog",
            "Cat",
            "Bitch",
            "Animal",
            "Dog",
            "Cat",
            "Bitch",
        ]
        funDropdownInitOne();
        // Do any additional setup after loading the view, typically from a nib.
        /*let bananaName = "Jimmy".banana;
        var someInt = 3;
        someInt.square();
        print("\(bananaName) ======= \(someInt)");*/
    }
    
    func funDropdownInitOne()
    {
        dropDownCtrlOne.selectionAction = { [unowned self] (index, item) in
            self.sysDropdownHolderOne.setTitle(item, forState: .Normal)
        }
        dropDownCtrlOne.anchorView = sysDropdownHolderOne
        dropDownCtrlOne.bottomOffset = CGPoint(x: 0, y:sysDropdownHolderOne.bounds.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sysShowDropdownSelectBox(sender: AnyObject) {
        if dropDownCtrlOne.hidden {
            dropDownCtrlOne.show()
        } else {
            dropDownCtrlOne.hide()
        }
        print(sysDropdownHolderOne.titleLabel?.text);
    }
}