//
//  TransitionAnimationsController.swift
//  UIKit-Animations
//
//  Created by Chelsi Christmas on 2/4/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class TransitionAnimationsController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    // CREATE TAP GESTURE
    private lazy var tapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer()
        // The target (here, self) is where the function for the gesture lives
        gesture.addTarget(self, action: #selector(animate))
        return gesture
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set default image
        imageView.image = UIImage(named: "dog")
        view.backgroundColor = .systemGreen
        
        // enabke user interaction on the image view or the label as those are two UI elements that are set to false by default
        // needs to be set top true in order foer the user to be able to interact with the object
        imageView.isUserInteractionEnabled = true
        
        // add gesture to the image view
        imageView.addGestureRecognizer(tapGesture)
        // if you want to make a gesture that interacts with the entire view( similar to the way that we interact with maps when we want to zoom we would code:
        // view.addGestureRecognizer(tapGesture)
        
    }
    
   @objc private func animate() {
    
    // The Four Built-In Bezier Animation Curves
    // curveEaseIn
    // curveEaseOut
    // curveLinear
    // curveEaseInOut
    let duration: Double = 1.5
    let curveOption: UIView.AnimationOptions = .curveEaseOut
    if imageView.image == UIImage(named: "dog") {
        UIView.transition(with: imageView, duration: duration, options: [.transitionFlipFromRight, curveOption], animations: {
            self.imageView.image = UIImage(named: "cat")
        })
        
    } else {
        UIView.transition(with: imageView, duration: duration, options: [.transitionFlipFromLeft, curveOption], animations: {
            self.imageView.image = UIImage(named: "dog")
        })
        
    }
    }
    
    

    

}
