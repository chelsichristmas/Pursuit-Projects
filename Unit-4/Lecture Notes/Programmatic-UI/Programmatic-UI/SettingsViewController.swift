//
//  SettingsViewController.swift
//  Programmatic-UI
//
//  Created by Chelsi Christmas on 1/28/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit
struct AppKey {
    static let appColorKey = "app color"
}

class SettingsViewController: UIViewController {
    
    private let settingsView = SettingsView()
    
    // data for picker view
    private let colors = ["Red", "Green", "Blue", "Orange", "Bubblegum", "Cyan", "Sky", "White", "Yellow", "Lime"]
    override func loadView() {
        view = settingsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let backgroundColor = UserDefaults.standard.object(forKey: AppKey.appColorKey) as? String  {
            view.backgroundColor = UIColor(named: backgroundColor)
        }
        
        
        settingsView.pickerView.delegate = self
        settingsView.pickerView.dataSource = self
        
    }

}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        colors.count
    }
}

extension SettingsViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let colorName = colors[row]
        view.backgroundColor = UIColor(named: colorName)
        
        // save color name to user defaults
        UserDefaults.standard.set(colorName, forKey: AppKey.appColorKey)
        
        
    }
}
