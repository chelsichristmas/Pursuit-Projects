//
//  ViewController.swift
//  Currency_Exchange
//
//  Created by Chelsi Christmas on 1/6/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var allCountryCodes = [Currency]()
    private var countryCode: String?
   
    private var countryCodes = ["AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD", "AWG", "AZN","BAM", "BBD", "BDT", "BGN", "BHD", "BIF", "BMD", "BND", "BOB", "BRL", "BSD", "BTC", "BTN", "BWP", "BYN", "BYR","BZD", "CAD", "CDF","CHF", "CLF", "CLP", "CNY", "COP", "CRC", "CUC", "CUP", "CVE", "CZK", "DJF", "DKK", "DOP", "DZD", "EGP", "ERN", "ETB", "EUR", "FJD", "FKP", "GBP", "GEL", "GGP", "GHS","GIP", "GMD", "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG", "HUF", "IDR", "IMP", "INR", "IQD", "IRR", "ISK", "JEP", "JMD", "JOD", "JPY", "KES", "KGS", "KHR", "KMF", "KPW", "KRW", "KWD", "KYD", "KZT", "LAK", "LBP", "LKR", "LRD", "LSL", "LTL", "LVL", "LYD", "MAD", "MDL", "MGA", "MKD", "MMK", "MNT", "MOP", "MRO", "MUR", "MVR", "MWK", "MXN", "MYR", "MZN", "NAD", "NGN", "NIO", "NOK", "NPR", "NZD", "OMR", "PAB", "PEN", "PGK", "PHP", "PKR", "PLN", "PYG", "QAR", "RON", "RSD", "RUB", "RWF", "SAR", "SBD", "SCR", "SDG", "SEK", "SGD", "SHP", "SLL", "SOS", "SRD", "STD", "SVC", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP", "TRY", "TTD", "TWD", "TZS", "UAH", "UGX", "USD", "UYU", "UZS", "VEF", "VND", "VUV", "WST", "XAF", "XAG", "XAU", "XCD", "XDR", "XOF", "XPF", "YER", "ZAR", "ZMK", "ZMW", "ZWL"]
    
    
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        countryCode = countryCodes.first
        updateUI()
        
    }
    
    func updateUI() {
        
        nextButton.setTitleColor(.blue, for: .normal)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let detailVC = segue.destination as? DetailViewController
            else {
                fatalError("Unable to access DetailViewController")
        }
        
        detailVC.currency = countryCode
        detailVC.countryCode = countryCode
        detailVC.allRates = allCountryCodes
    }
    
    func getCountries() {
        CurrencySearchAPI.fetchInfo( completion: { (result) in
            switch result{
            case .failure(let appError):
                print("error \(appError)")
            case .success(let allCountryCodes):
                DispatchQueue.main.async {
                    self.allCountryCodes = allCountryCodes
                    dump(allCountryCodes)
                }
            }
            
        })
    }
    
    
    @IBAction func next(_ sender: Any) {
        getCountries()
     

    
}
    
}



extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryCodes.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        countryCode = countryCodes[row]
        return countryCodes[row]
        
    }
}



