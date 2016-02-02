//
//  DropDownSelectBoxCell.swift
//  SwiftDropdownSelectBoxOne
//
//  Created by NextDot on 2/2/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import Foundation
import UIKit

internal final class DropDownSelectBoxCell: UITableViewCell {
    
    //MARK: - Properties
    static let Nib = UINib(nibName: "DropDownSelectBoxCell", bundle: NSBundle(forClass: DropDownSelectBoxCell.self))
    
    //UI
    @IBOutlet weak var optionLabel: UILabel!
    
    var selectedBackgroundColor: UIColor?
    
}

//MARK: - UI

internal extension DropDownSelectBoxCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor.clearColor()
    }
    
    override var selected: Bool {
        willSet {
            setSelected(newValue, animated: false)
        }
    }
    
    override var highlighted: Bool {
        willSet {
            setSelected(newValue, animated: false)
        }
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        setSelected(highlighted, animated: animated)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        let executeSelection: () -> Void = { [unowned self] in
            if let selectedBackgroundColor = self.selectedBackgroundColor {
                if selected {
                    self.backgroundColor = selectedBackgroundColor
                } else {
                    self.backgroundColor = UIColor.clearColor()
                }
            }
        }
        
        if animated {
            UIView.animateWithDuration(0.3, animations: {
                executeSelection()
            })
        } else {
            executeSelection()
        }
    }
}