//
//  Test+Extension.swift
//  SwiftDropdownSelectBoxOne
//
//  Created by NextDot on 2/2/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var banana : String {
        let shortName = String(characters.dropFirst(1))
        return "\(self) \(self) Bo B\(shortName) Banana Fana Fo F\(shortName)"
    }
}
extension Int
{
    mutating func square()
    {
        self = self * self
    }
}