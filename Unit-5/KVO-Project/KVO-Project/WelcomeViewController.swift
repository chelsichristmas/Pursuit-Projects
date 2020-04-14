//
//  WelcomeViewController.swift
//  KVO-Project
//
//  Created by Chelsi Christmas on 4/7/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    private var fontSizeObservation: NSKeyValueObservation?
    private var iconNameObservation: NSKeyValueObservation?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureObservers()
        // Do any additional setup after loading the view.
    }
    
    private func configureObservers() {
        configureFontSizeObservation()
        configureIconNameObservation()
    }
    
    private func configureFontSizeObservation() {
        fontSizeObservation = Settings.shared.observe(\.fontSize, options: [.old, .new], changeHandler: { [weak self]  (settings, change) in
            guard let newSize = change.newValue else { return }
            // update UI
            let fontSize = CGFloat(newSize)
            self?.welcomeLabel.font = UIFont.systemFont(ofSize: fontSize)
        })
    }
    
    private func configureIconNameObservation() {
        iconNameObservation = Settings.shared.observe(\.iconName, options: [.old, .new], changeHandler: { [weak self] (settings, change) in
            
            guard let iconName = change.newValue else { return }
            
            self?.iconImageView.image = UIImage(systemName: iconName)
        
        })
    }
    
    deinit { // gets called when the object is no longer in memory
        // it holds unnecessary if we're still observing when we're no longer on the page
        fontSizeObservation?.invalidate()
        iconNameObservation?.invalidate()
        
        //deinit is part of the view controllers life cycle
    }
    
}
