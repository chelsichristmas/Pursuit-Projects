//
//  TapGestureController.swift
//  UIKit-Gestures
//
//  Created by Chelsi Christmas on 2/3/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit
/* UITapGestureRecognizer()
 long press
 rotation
 swipe, left, right, up, down
 pinch
 pan
 */

class TapGestureController: UIViewController {

    @IBOutlet weak var heartImageView: UIImageView!
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(didTap(_:)))
        // gesture.numberOfTapsRequired = 1 (this is the default value)
        //gesture.numberOfTouchesRequired = 1 (refers to the number of fingers required, the default is 1)
        return gesture
    }()
    
    // 1. configure a tap gesture
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple

        // 2. add the gesture to the image view
        heartImageView.addGestureRecognizer(tapGesture)
        // ESSENTIAL for making the gesture work
        heartImageView.isUserInteractionEnabled = true
    }
    
    // 3. we need a selector (method) that gets called when the gesture is triggered
    
    @objc private func didTap(_ gesture:UITapGestureRecognizer) {
        heartImageView.image = UIImage(systemName: "heart.fill")
    }

    

}
