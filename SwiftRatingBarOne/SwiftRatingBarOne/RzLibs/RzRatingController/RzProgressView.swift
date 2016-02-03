//
//  RzProgressView.swift
//  SwiftRatingBarOne
//
//  Created by NextDot on 2/3/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit

class RzProgressView: UIView {
    var filledView: UIView = UIView(frame: CGRect(x: 100, y: 100, width: 0, height: 100))
    var progress: CGFloat = 0
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // <-- You need to implement this
        //fatalError()
    }
    override init(frame: CGRect) {
        filledView = UIView(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: 0, height: frame.height))
        filledView.backgroundColor = UIColor.redColor()
        
        super.init(frame: frame)
        addSubview(filledView)
    }
    //    override func layoutSubviews()
    //    {
    //        //
    //    }
    
    func setProgess(var progress: CGFloat) {
        progress = min(max(progress, 0), 1) // Between 0 and 1
        self.progress = progress
        
        filledView.frame.size.width = self.frame.width * progress
    }
}