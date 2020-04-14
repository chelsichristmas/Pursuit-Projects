//
//  ViewController.swift
//  UIScrollView-UIImage-Zooming
//
//  Created by Chelsi Christmas on 2/3/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var subwayMap: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // step 2: set the maximumZoomScaleValue greater tahn 1
        // provide a maximumZoomScale of greater than 1
        // 1 is the default value, if not set womn't zoom
        scrollView.delegate = self
         scrollView.maximumZoomScale = 5.0
    }
    
    
   


}

//step 1: return the view for zooming
extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return subwayMap
    }
}

