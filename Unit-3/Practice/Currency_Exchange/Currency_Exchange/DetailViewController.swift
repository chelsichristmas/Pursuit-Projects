//
//  DetailViewController.swift
//  Currency_Exchange
//
//  Created by Chelsi Christmas on 1/6/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var currency: String?
    var countryCode: String?
    var allRates = [Currency]()
    var firstRate = 0.0
    var secondRate = 0.0
    
    
    private var countryCodes = ["AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD", "AWG", "AZN","BAM", "BBD", "BDT", "BGN", "BHD", "BIF", "BMD", "BND", "BOB", "BRL", "BSD", "BTC", "BTN", "BWP", "BYN", "BYR","BZD", "CAD", "CDF","CHF", "CLF", "CLP", "CNY", "COP", "CRC", "CUC", "CUP", "CVE", "CZK", "DJF", "DKK", "DOP", "DZD", "EGP", "ERN", "ETB", "EUR", "FJD", "FKP", "GBP", "GEL", "GGP", "GHS","GIP", "GMD", "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG", "HUF", "IDR", "IMP", "INR", "IQD", "IRR", "ISK", "JEP", "JMD", "JOD", "JPY", "KES", "KGS", "KHR", "KMF", "KPW", "KRW", "KWD", "KYD", "KZT", "LAK", "LBP", "LKR", "LRD", "LSL", "LTL", "LVL", "LYD", "MAD", "MDL", "MGA", "MKD", "MMK", "MNT", "MOP", "MRO", "MUR", "MVR", "MWK", "MXN", "MYR", "MZN", "NAD", "NGN", "NIO", "NOK", "NPR", "NZD", "OMR", "PAB", "PEN", "PGK", "PHP", "PKR", "PLN", "PYG", "QAR", "RON", "RSD", "RUB", "RWF", "SAR", "SBD", "SCR", "SDG", "SEK", "SGD", "SHP", "SLL", "SOS", "SRD", "STD", "SVC", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP", "TRY", "TTD", "TWD", "TZS", "UAH", "UGX", "USD", "UYU", "UZS", "VEF", "VND", "VUV", "WST", "XAF", "XAG", "XAU", "XCD", "XDR", "XOF", "XPF", "YER", "ZAR", "ZMK", "ZMW", "ZWL"]
    
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var firstCurrencyTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var firstCurrencyLabel: UILabel!
    @IBOutlet weak var convertedValue: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        updateUI()
        print(countryCodes.count)
        getCountries()
        
        var firstRate: Currency?
        print(firstRate?.rates)
        
    }
    
    func math() {
        var firstRate: Currency?
        firstRate?.rates
        
        
    }
    
    
    
    
    func updateUI() {
        countryCodeLabel.text = currency!
        firstCurrencyLabel.text = currency
        
    }
    
    func getCountries() {
        CurrencySearchAPI.fetchInfo( completion: { (result) in
            switch result{
            case .failure(let appError):
                print("error \(appError)")
            case .success(let allRates):
                DispatchQueue.main.async {
                    self.allRates = allRates
                    dump(allRates)
                }
            }
            
        })
        
        
        
    }
    @IBAction func convert(_ sender: Any) {
        
        
     
        
       
        
        
        
    }
}

extension DetailViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryCodes.count
    }
}

extension DetailViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return countryCodes[row]
    }
}
