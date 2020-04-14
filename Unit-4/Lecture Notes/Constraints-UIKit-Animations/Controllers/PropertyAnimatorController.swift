//
//  PropertyAnimatorController.swift
//  UIKit-Animations
//
//  Created by Chelsi Christmas on 2/4/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class PropertyAnimatorController: UIViewController {

    @IBOutlet weak var duckImage: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    private var animator: UIViewPropertyAnimator!
    
    override func viewWillAppear(_ animated: Bool) {
        
        slider.setValue(0, animated: true)
        duckImage.image = UIImage(named: "duck")
//        animator = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut, animations: {
//            // here we declare the animation
//
//            // PERFORM A TRANSFORMATION
//            // y makes it get longer
//            // x makes it get wider
//            self.duckImage.transform = CGAffineTransform(scaleX: 1.5, y: 20)
//
//        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        // TODO: Figure out how to make the animations occur every time we come back to the page
        // The duck needs to rset
        animator = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut, animations: {
            // here we declare the animation

            // PERFORM A TRANSFORMATION
            // y makes it get longer
            // x makes it get wider
            
            self.duckImage.transform = CGAffineTransform(scaleX: 1.5, y: 20)

        })
    }
    
    func saveOriginalState() {
        let width = duckImage.widthAnchor
//        let height = duckImage.
    }

    @IBAction func sliderDidChange(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
    }

}
