//
//  MainView.swift
//  Programmatic-UI
//
//  Created by Chelsi Christmas on 1/28/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class MainView: UIView {
    
   
    
    
    let defaultMessage = "No default color set. Please go to settings"
    // create a label
    
    
    // lazy waits until the instance is created
    // they are not called untiol the instance is created
    // it guarantees taht the body exists before it gets calle
    public lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemYellow
        label.text = defaultMessage
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
    
        return label
    }() // () calls a closure and calls simultaneously
    // TODO: syntax terminology
    
// This variable will cause an error because the variable defaultMessage hasn't been created yet
//    var someLabel: UILabel = {
//        let label = UILabel()
//        label.text = defaultMessage // DOES NOT COMPILE
//        return label
//    }()
    
    // CREATE A BUTTON
    
    public lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.systemYellow, for: .normal)
        return button
    }()
    
// init(frame: ) gets called if view is done programmatically
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    

    // if this view gets initialized from storyboard
    // this initializer gets called
    // Theres a question mark after the init because its a failable initializer and it can be nil
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setUpMessageLabel()
        setupResetButtonConstraints()
        
    }
    
    private func setUpMessageLabel() {
        // add the messageLabel to the MainView
        addSubview(messageLabel) // returns the messageLabel we created above
        
        // set constraints for the messageLabel
        // this property is true by layout so we first have to set it to false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // set top anchor 20 points from the safe area top
            messageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            
        ])
    }
    
    private func setupResetButtonConstraints() {
        // Programatically creating constraints
        //1. Add the subview
        addSubview(resetButton)
        
        //2. Set "translatesAutoresizingMaskIntoConstraints" to false (The default is true)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        //3. set constarits usinfg NSLayoutConstraint.activate array
        
        NSLayoutConstraint.activate([
            resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            resetButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 40)
        ])
    }
}
