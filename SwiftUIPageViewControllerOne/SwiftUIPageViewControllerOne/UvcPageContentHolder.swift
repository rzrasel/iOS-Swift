//
//  UvcPageContentHolder.swift
//  SwiftUIPageViewControllerOne
//
//  Created by NextDot on 2/14/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit

class UvcPageContentHolder: UIViewController {
    //|------------------------------------|
    @IBOutlet var sysImageHolder: UIImageView!
    var imageFileName: String!
    var pageIndex: Int!
    //|------------------------------------|
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sysImageHolder.image = UIImage(named: imageFileName)
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
}