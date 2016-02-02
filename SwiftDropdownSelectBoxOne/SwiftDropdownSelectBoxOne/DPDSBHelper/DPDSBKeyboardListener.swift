//
//  DPDSBKeyboardListener.swift
//  SwiftDropdownSelectBoxOne
//
//  Created by NextDot on 2/2/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import Foundation
import UIKit

internal final class DPDSBKeyboardListener {
    static let sharedInstance = DPDSBKeyboardListener()
    
    private(set) var isVisible = false
    private(set) var keyboardFrame = CGRectZero
    private var isListening = false
    deinit {
        stopListeningToKeyboard()
    }
}

//MARK: - Notifications
extension DPDSBKeyboardListener {
    func startListeningToKeyboard() {
        if isListening {
            return
        }
        
        isListening = true
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "keyboardDidShow:",
            name: UIKeyboardDidShowNotification,
            object: nil)
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "keyboardDidHide:",
            name: UIKeyboardDidHideNotification,
            object: nil)
    }
    
    func stopListeningToKeyboard() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    @objc
    private func keyboardDidShow(notification: NSNotification) {
        isVisible = true
        keyboardFrame = keyboardFrameFromNotification(notification)
    }
    
    @objc
    private func keyboardDidHide(notification: NSNotification) {
        isVisible = false
        keyboardFrame = keyboardFrameFromNotification(notification)
    }
    
    private func keyboardFrameFromNotification(notification: NSNotification) -> CGRect {
        return (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue() ?? CGRectZero
    }
}