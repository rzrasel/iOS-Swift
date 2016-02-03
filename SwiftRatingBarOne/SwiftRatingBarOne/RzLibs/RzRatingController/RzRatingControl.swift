//
//  RzRatingControl.swift
//  SwiftRatingBarOne
//
//  Created by NextDot on 2/3/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit

class RzRatingControl: UIView {
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    var btnSize = CGFloat(24);
    var ratingButtons = [UIButton]()
    var spacing = 2
    var stars = 5
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    // MARK: Initialization
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        var filledStarImage: UIImage!;
        var emptyStarImage: UIImage!;
        
        let filledStarImageTemp = UIImage(named: "filled_star")
        let emptyStarImageTemp = UIImage(named: "empty_star")
        
        filledStarImage = filledStarImageTemp!.imageResize(filledStarImageTemp!, scaledToSize: CGSizeMake(btnSize, btnSize))
        emptyStarImage = emptyStarImageTemp!.imageResize(emptyStarImageTemp!, scaledToSize: CGSizeMake(btnSize, btnSize))
        
        for _ in 0..<stars {
            let button = UIButton()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(btnSize)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * stars
        
        return CGSize(width: width, height: buttonSize)
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        print("Rating:- \(rating)")
        
        updateButtonSelectionStates()
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected.
            button.selected = index < rating
        }
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
}