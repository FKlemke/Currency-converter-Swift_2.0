//
//  ViewController.swift
//  Ue4-Klemke
//
//  Created by Felix E.C. Klemke on 28/11/15.
//  Copyright © 2015 Klemke-Fiebig. All rights reserved.
//

import UIKit

enum Currency: String {
    case EUR, USD, GBP
    }


class ViewController: UIViewController {
    
    var updateCurrRate = UpdateRates()
    var currencies = [Currency : Double]()
    
    @IBOutlet weak var eurUsdConversionRate: UITextField!
    @IBOutlet weak var eurGbpConversionRate: UITextField!
    @IBOutlet weak var eurVal: UITextField!
    @IBOutlet weak var usdVal: UITextField!
    @IBOutlet weak var gbpVal: UITextField!
    
    func setDummyData(){
        eurUsdConversionRate.text = "1.0651"
        eurGbpConversionRate.text = "0.7011"
        eurVal.text = "1"
        usdVal.text = "1.07"
        gbpVal.text = "0.70"
    }
    
    func initCurrs(){
        currencies[Currency.EUR] = 1
        currencies[Currency.USD] = 1
        currencies[Currency.GBP] = 1
    }
    
    //rates
    @IBAction func eurUsdManConvChange(sender: AnyObject) {
        if let eurValValid = Double(eurVal.text!){
            if let usdValValid = Double(usdVal.text!){
                //TODO does not work
                let valueAA = eurValValid * usdValValid
                print("Here? \(valueAA)")
                usdVal.text = String(valueAA)
            }
        }
        print("EUR USD changed")
//        guard let eurValValid = try? Double(eurVal.text!)! else{}
//        guard let usdValValid = try? Double(usdVal.text!)! else{}
//        usdVal.text = String(eurValValid * usdValValid)
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
    @IBAction func updateRates(sender: AnyObject) {
//  tried using the guard statement but error was thrown and no idea how to catch it
//        guard let eurUsdRate = try? updateCurrRate.updateRateFromYahoo(Currency.EUR, buyingCurrency: Currency.USD) else { throw CurrencyConversionError.CurrencyNotFound }
//        guard let eurGbpRate = try? updateCurrRate.updateRateFromYahoo(Currency.EUR, buyingCurrency: Currency.GBP) else { throw CurrencyConversionError.CurrencyNotFound }

        if let eurUsdRate = try? updateCurrRate.updateRateFromYahoo(Currency.EUR, buyingCurrency: Currency.USD){
            eurUsdConversionRate.text = String(eurUsdRate)
        }
        if let eurGbpRate = try? updateCurrRate.updateRateFromYahoo(Currency.EUR, buyingCurrency: Currency.GBP){
           eurGbpConversionRate.text = String(eurGbpRate)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDummyData()
        initCurrs()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

