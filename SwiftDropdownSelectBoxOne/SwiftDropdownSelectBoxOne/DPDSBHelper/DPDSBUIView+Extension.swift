//
//  DPDSBUIView+Extension.swift
//  SwiftDropdownSelectBoxOne
//
//  Created by NextDot on 2/2/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Constraints

internal extension UIView {
    func addConstraints(format format: String, options: NSLayoutFormatOptions = [], metrics: [String: AnyObject]? = nil, views: [String: UIView]) {
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: options, metrics: metrics, views: views))
    }
    
    func addUniversalConstraints(format format: String, options: NSLayoutFormatOptions = [], metrics: [String: AnyObject]? = nil, views: [String: UIView]) {
        addConstraints(format: "H:\(format)", options: options, metrics: metrics, views: views)
        addConstraints(format: "V:\(format)", options: options, metrics: metrics, views: views)
    }
}

//MARK: - Bounds

internal extension UIView {
    var windowFrame: CGRect? {
        return superview?.convertRect(frame, toView: nil)
    }
}

internal extension UIWindow {
    static func visibleWindow() -> UIWindow? {
        var currentWindow = UIApplication.sharedApplication().keyWindow
        
        if currentWindow == nil {
            let frontToBackWindows = Array(UIApplication.sharedApplication().windows.reverse())
            
            for window in frontToBackWindows {
                if window.windowLevel == UIWindowLevelNormal {
                    currentWindow = window
                    break
                }
            }
        }
        
        return currentWindow
    }
}