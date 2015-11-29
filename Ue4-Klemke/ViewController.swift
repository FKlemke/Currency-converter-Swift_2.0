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
    var conversionRates = [String : Double]()
    
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
    
    func populateConversionRates(){
        var allCurrs = [String]()
        for curr in currencies{
            allCurrs.append(curr.0.rawValue)
        }
        
        func perm(allCurrs : [String]){
            let len = allCurrs.count
            
        }
        


    }
    
    
    //rates
    @IBAction func eurUsdManConvChange(sender: AnyObject) {
        if let eurValValid = Double(eurVal.text!){
            if let usdConRateValid = Double(eurUsdConversionRate.text!){
                currencies[Currency.USD] = eurValValid * usdConRateValid
                usdVal.text = String(currencies[Currency.USD]!)
            }
        }
//pyramid of doom :(
//        guard let eurValValid = try? Double(eurVal.text!)! else{}
//        guard let usdValValid = try? Double(usdVal.text!)! else{}
//        usdVal.text = String(eurValValid * usdValValid)
    }
    
    @IBAction func eurGbpManConvChange(sender: AnyObject) {
        if let eurValValid = Double(eurVal.text!){
            if let gbpConRateValid = Double(eurGbpConversionRate.text!){
                currencies[Currency.GBP] = eurValValid * gbpConRateValid
                gbpVal.text = String(currencies[Currency.GBP]!)
            }
        }
    }
    
    //values
    @IBAction func eurValManChange(sender: AnyObject) {
        //terrible boilerplate code
        if let eurValValid = Double(eurVal.text!){
            if let usdConRateValid = Double(eurUsdConversionRate.text!){
                usdVal.text = String(eurValValid * usdConRateValid)
            }
             if let gbpConRateValid = Double(eurGbpConversionRate.text!){
                gbpVal.text = String(eurValValid * gbpConRateValid)
            }
        }
    }
    
    @IBAction func usdValManChange(sender: AnyObject) {
        
        if let usdValValid = Double(usdVal.text!){
            
        }
        
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
        populateConversionRates()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

