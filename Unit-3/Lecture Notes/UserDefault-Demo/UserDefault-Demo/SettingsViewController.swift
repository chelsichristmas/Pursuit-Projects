//
//  SettingsViewController.swift
//  UserDefault-Demo
//
//  Created by Chelsi Christmas on 1/13/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit


class SettingsViewController: UITableViewController {
    
    @IBOutlet weak var unitMeasurementLabel: UILabel!
    
    @IBOutlet weak var activityImage: UIImageView!
    
    var currentUnit = UnitMeasurement.miles {
        didSet {
            // update the unitMeasuremnetLabel
            unitMeasurementLabel.text = currentUnit.rawValue // "Miles" or "Kilometers"
            
            // update value in user defaults
            UserPreference.shared.updateUnitMeasurement(with: currentUnit)
        }
    }
    
    var currentImage = ActivityImage.bike {
        didSet {
            activityImage.image = UIImage(named: currentImage.rawValue)
            UserPreference.shared.updateImageView(with: currentImage)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        // retrieve any defaults in UserDefaults as needed
        if let unitMeasurement = UserPreference.shared.getUnitMeasuremnet() {
            currentUnit = unitMeasurement
        }
        
        if let activityImage = UserPreference.shared.getImageView() {
            currentImage = activityImage
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // toggle between "Miles" or "Kilometers"
        
        switch indexPath.row {
        case 0:
            //toggle unitMeasurementLabel
            toggleUnitMeasurement()
        case 1:
            toggleActivityImage()
        default:
            break
        }
        
       
    }
    
    private func  toggleUnitMeasurement() {
        
        // read this like an if statement if currentUnit = miles change it's value to kilometers and vice versa
        currentUnit = currentUnit == UnitMeasurement.miles ? UnitMeasurement.kilometers : UnitMeasurement.miles
    }
    
    private func toggleActivityImage() {
        currentImage = currentImage == ActivityImage.bike ? ActivityImage.run : ActivityImage.bike
    }
}
