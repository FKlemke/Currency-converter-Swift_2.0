//
//  ViewController.swift
//  Ue4-Klemke
//
//  Created by Felix E.C. Klemke on 28/11/15.
//  Copyright © 2015 Klemke-Fiebig. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var updateCurrRate = UpdateRates()
    var currencies = [Currency]()
    
    @IBOutlet weak var eurUsdConversionRate: UITextField!
    @IBOutlet weak var eurGbpConversionRate: UITextField!
    @IBOutlet weak var eurVal: UITextField!
    @IBOutlet weak var usdVal: UITextField!
    @IBOutlet weak var gbpVal: UITextField!
    
    func setTestData(){
        eurUsdConversionRate.text = "1.0651"
        eurGbpConversionRate.text = "0.7011"
        eurVal.text = "1"
        usdVal.text = "1.07"
        gbpVal.text = "0.70"
    }
    
    func initCurrs(){
        let xeu = Currency(name: "Euro", currCode: "EUR", value: 1.0)
        let gbp = Currency(name: "British Pound",currCode: "GBP", value: 1.0)
        let usd = Currency(name: "Dollar", currCode: "USD", value: 1.0)
        currencies.append(xeu)
        currencies.append(gbp)
        currencies.append(usd)
    }
    
    //rates
    @IBAction func eurUsdManConvChange(sender: AnyObject) {
    }
    
    @IBAction func eurGbpManConvChange(sender: AnyObject) {
    }
    
    //values
    @IBAction func eurValManChange(sender: AnyObject) {
    }
    
    @IBAction func usdValManChange(sender: AnyObject) {
    }
    
    @IBAction func gbpValManChange(sender: AnyObject) {
    }
    
    //updateRates
    @IBAction func updateRates(sender: AnyObject) throws {
        guard let eurUsdRate = try? updateCurrRate.updateRates(currencies[0], buyingCurrency: currencies[1]) else { throw CurrencyConversionError.CurrencyNotFound }
        
        guard let eurGbpRate = try? updateCurrRate.updateRates(currencies[0], buyingCurrency: currencies[2]) else { throw CurrencyConversionError.CurrencyNotFound }
        
        eurUsdConversionRate.text = String(eurUsdRate)
        eurGbpConversionRate.text = String(eurGbpRate)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTestData()
        initCurrs()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

