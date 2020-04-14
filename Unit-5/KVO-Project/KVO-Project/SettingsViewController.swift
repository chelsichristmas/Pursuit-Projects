//
//  SettingsViewController.swift
//  KVO-Project
//
//  Created by Chelsi Christmas on 4/7/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var fontSizeLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    private var fontSizeObservation: NSKeyValueObservation?
    
    // data for th epicker view
    private let iconNames = ["sun.haze.fill", "moon", "globe", "icloud"] // SFSymbol image names e.g "moon"
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePickerView()
        configureFontSizeObservation()
        
        // Do any additional setup after loading the view.
    }
    
    private func configurePickerView() {
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    private func configureFontSizeObservation() {
        fontSizeObservation = Settings.shared.observe(\.fontSize, options: [.old, .new], changeHandler: { [weak self] (settings, change) in
            guard let newSize = change.newValue else { return }
            self?.fontSizeLabel.text = newSize.description
            
        })
    }
    @IBAction func sliderChanged(_ sender: UISlider!) {
        let newSize = Int(sender.value) // cast Float to integer as our settigns Fontsize is an int
        Settings.shared.fontSize = newSize
    }
}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return iconNames.count
    }
    
    
}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return iconNames[row]
        

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let iconName = iconNames[row]
        Settings.shared.iconName = iconName
    }
}
