//
//  FirstViewController.swift
//  Tester
//
//  Created by Chelsi Christmas on 2/14/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
@IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var safariButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        updateUI()
    }
    
    
    func updateUI() {
        safariButton.setImage(UIImage(named: "Safari"), for: .normal)
    }

    

}
