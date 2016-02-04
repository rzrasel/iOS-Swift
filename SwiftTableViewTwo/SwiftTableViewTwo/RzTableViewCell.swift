//
//  RzTableViewCell.swift
//  SwiftTableViewTwo
//
//  Created by NextDot on 2/4/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit

class RzTableViewCell: UITableViewCell {
    @IBOutlet var sysTabDataLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}