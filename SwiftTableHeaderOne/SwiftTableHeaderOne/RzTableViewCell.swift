//
//  RzTableViewCell.swift
//  SwiftTableHeaderOne
//
//  Created by NextDot on 2/11/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit

class RzTableViewCell: UITableViewCell {
    //|------------------------------------|
    @IBOutlet var sysLblHeadName: UILabel!
    @IBOutlet var sysLblHeadAge: UILabel!
    //|------------------------------------|
    @IBOutlet var sysLblContentName: UILabel!
    @IBOutlet var sysLblContentAge: UILabel!
    
    //|------------------------------------|
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
}