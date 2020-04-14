//
//  GesturesTabController.swift
//  UIKit-Gestures
//
//  Created by Chelsi Christmas on 2/3/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class GesturesTabController: UITabBarController {
    
    private lazy var tapGestureVC: TapGestureController = {
        
        // we need the storyobard instance
        let storyboard = UIStoryboard(name:"TapGesture", bundle: nil)
        
        guard let viewController = storyboard.instantiateViewController(identifier: "TapGestureController") as? TapGestureController else {
            fatalError("Could not downcastto TapGetsureController")
            }
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [tapGestureVC, SwipeGestureController()]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
