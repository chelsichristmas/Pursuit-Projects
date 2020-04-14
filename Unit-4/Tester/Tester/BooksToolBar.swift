//
//  BooksToolBar.swift
//  Tester
//
//  Created by Chelsi Christmas on 2/13/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class BooksToolBar: UIToolbar {
    
    public lazy var toolBar: UIToolbar = {
        let toolbar = UIToolbar()
        // set up toolbar color and button spacing
        // add items to toolbar
        toolbar.barTintColor = .orange
        return toolbar
    }()

    override init(frame: CGRect) {
           super.init(frame: UIScreen.main.bounds)
           commonInit()
       }
       
       required init? (coder: NSCoder) {
           super.init(coder: coder)
           commonInit()
       }
       private func commonInit(){
        setupToolBarConstraints()
       }
    
    private func setupToolBarConstraints() {
        addSubview(toolBar)
        
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toolBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            toolBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            toolBar.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            toolBar.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
   
    
    
    }
