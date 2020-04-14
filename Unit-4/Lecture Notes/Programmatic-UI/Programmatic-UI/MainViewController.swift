//
//  ViewController.swift
//  Programmatic-UI
//
//  Created by Chelsi Christmas on 1/28/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    
    
    private let mainView = MainView()
    // if doing programmatic UI implement and setup the view
     // in loadView()
     // loadView() gets called before the viewDidLoad()
     // do not call super when overriding loadView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        configureNavBar()
        mainView.resetButton.addTarget(self, action: #selector(resetAppColor(_:)), for: .touchUpInside)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        // gets called every time we go to this view
        super.viewWillAppear(true)
        updateAppColor()
    }
    
    private func updateAppColor() {
        if let colorName = UserDefaults.standard.object(forKey: AppKey.appColorKey) as? String {
            
            view.backgroundColor = UIColor(named: colorName)
        }
        
    
    }
    
    private func configureNavBar() {
        // set title of navigation bar
        navigationItem.title = "Programmatic UI"
        
        // adding a UIBarButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(showSettings(_:)))
    }
    
    @objc
    private func showSettings(_ sender: UIBarButtonItem) {
        // segue to the SettingsViewController
        let settingsVC = SettingsViewController()
        navigationController?.pushViewController(settingsVC, animated: true)
        
        
       // present(settingsVC, animated:true)
    
    }
    
    @objc private func resetAppColor(_ sender: UIButton) {
        print("reset app color")
    }
}

