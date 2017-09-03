//
//  ViewController.swift
//  Custom Popover
//
//  Created by Christopher Goldsby on 9/3/17.
//  Copyright © 2017 Christopher Goldsby. All rights reserved.
//

import UIKit

final class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var callToActionButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let popoverViewController = segue.destination
        
        // Override the presentation style on the iPhone so that the popover does not appear in fullscreen
        popoverViewController.popoverPresentationController?.delegate = self
        
        // Given the orientation of the iPhone, present the popover either above or to the right of the label
        popoverViewController.popoverPresentationController?.permittedArrowDirections = [.down, .left]
        
        // Define the size of the popover
        popoverViewController.preferredContentSize = CGSize(width: 100, height: 100)
        
        // Present the popover from the label instead of the CTA button
        popoverViewController.popoverPresentationController?.sourceRect = label.frame
        popoverViewController.popoverPresentationController?.sourceView = label
        
        // Style the background and arrow for popover
        popoverViewController.popoverPresentationController?.popoverBackgroundViewClass = PopoverBackgroundView.self
    }
    
    // MARK: - UIPopoverPresentationControllerDelegate
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    // MARK: - Private
    
    private func setUpView() {
        callToActionButton.layer.borderColor = UIColor.white.cgColor
        callToActionButton.contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10)
    }
}
