//
//  DPDSBConstant.swift
//  SwiftDropdownSelectBoxOne
//
//  Created by NextDot on 2/2/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import Foundation
import UIKit

internal struct DPDSBConstant {
    
    internal struct KeyPath {
        static let Frame = "frame"
    }
    
    internal struct ReusableIdentifier {
        static let DropDownSelectBoxCell = "DropDownSelectBoxCell"
    }
    
    internal struct UI {
        static let BackgroundColor = UIColor(white: 0.94, alpha: 1)
        static let SelectionBackgroundColor = UIColor(white: 0.89, alpha: 1)
        static let SeparatorColor = UIColor.clearColor()
        static let SeparatorStyle = UITableViewCellSeparatorStyle.None
        static let SeparatorInsets = UIEdgeInsetsZero
        static let CornerRadius: CGFloat = 2
        static let RowHeight: CGFloat = 44
        static let HeightPadding: CGFloat = 20
        struct Shadow {
            static let Color = UIColor.darkGrayColor().CGColor
            static let Offset = CGSizeZero
            static let Opacity: Float = 0.4
            static let Radius: CGFloat = 8
        }
    }
    
    internal struct Animation {
        static let Duration = 0.15
        static let EntranceOptions: UIViewAnimationOptions = [.AllowUserInteraction, .CurveEaseOut]
        static let ExitOptions: UIViewAnimationOptions = [.AllowUserInteraction, .CurveEaseIn]
        static let DownScaleTransform = CGAffineTransformMakeScale(0.9, 0.9)
    }
}