//
//  PopoverBackgroundView.swift
//  Custom Popover
//
//  Created by Christopher Goldsby on 9/3/17.
//  Copyright © 2017 Christopher Goldsby. All rights reserved.
//

import UIKit


final class PopoverBackgroundView: UIPopoverBackgroundView {
    
    private var offset = CGFloat(0)
    private var arrow = UIPopoverArrowDirection.any
    private var backgroundImageView: UIImageView!
    
    override var arrowDirection: UIPopoverArrowDirection {
        get { return arrow }
        set { arrow = newValue }
    }
    
    override var arrowOffset: CGFloat {
        get { return offset }
        set { offset = newValue }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    override static func contentViewInsets() -> UIEdgeInsets {
        return .zero
    }
    
    override static func arrowHeight() -> CGFloat {
        return 6
    }
    
    override class var wantsDefaultContentAppearance: Bool {
        return false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var backgroundImageViewFrame = bounds
        
        switch arrowDirection {
        case .down:
            backgroundImageViewFrame.size.height -= PopoverBackgroundView.arrowHeight()
        default:
            backgroundImageViewFrame.size.width -= PopoverBackgroundView.arrowHeight()
            backgroundImageViewFrame.origin.x += PopoverBackgroundView.arrowHeight()
        }
        
        backgroundImageView.frame = backgroundImageViewFrame
    }
    
    // MARK: - Private
    
    private func setUpView() {
        backgroundImageView = UIImageView(image: UIImage(named: "Bubble"))
        addSubview(backgroundImageView)
        
        // Disable default shadow
        layer.shadowColor = UIColor.clear.cgColor
    }
}
