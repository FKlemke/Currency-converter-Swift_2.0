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
    
    var updateClass = UpdateRates()
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
        //getting the arraylist with all currs
        var allCurrs = [String]()
        for curr in currencies{
            allCurrs.append(curr.0.rawValue)
        }
        
        for perm1 in allCurrs{
            //nested loops exponential complexity recursive approach did not work
            let selectedCurr = perm1
            for perm2 in allCurrs{
                if selectedCurr != perm2{
                    conversionRates["\(perm1)\(perm2)"] = 0
                }
            }
        }
    }
    
    //rates
    @IBAction func eurUsdManConvChange(sender: AnyObject) {
        //manual conversion rate change
        if let convRateValid = Double(eurUsdConversionRate.text!){
            conversionRates["EURUSD"] = convRateValid
            print("EURUSD rate changed to: \(convRateValid)")
            
                if let eurValValid = Double(eurVal.text!){
                    currencies[Currency.USD] = updateValues("EURUSD", value: eurValValid)
                    usdVal.text = String(format: "%.2lf", currencies[Currency.USD]!)
                }//boilerplate
            
        }
    }
    
    @IBAction func eurGbpManConvChange(sender: AnyObject) {
        //manual conversion rate change
        if let convRateValid = Double(eurGbpConversionRate.text!){
            conversionRates["EURGBP"] = convRateValid
            print("EURGBP rate changed to: \(convRateValid)")
            
            if let eurValValid = Double(eurVal.text!){
                currencies[Currency.GBP] = updateValues("EURGBP", value: eurValValid)
                gbpVal.text = String(format: "%.2lf", currencies[Currency.GBP]!)
            }//boilerplate
        }
    }
    
    //values
    @IBAction func eurValManChange(sender: AnyObject) {
        if let eurValValid = Double(eurVal.text!){
            currencies[Currency.USD] = updateValues("EURUSD", value: eurValValid)
            usdVal.text = String(format: "%.2lf", currencies[Currency.USD]!)
            currencies[Currency.GBP] = updateValues("EURGBP", value: eurValValid)
            gbpVal.text = String(format: "%.2lf", currencies[Currency.GBP]!)
        }
    }
    
    @IBAction func usdValManChange(sender: AnyObject) {
        if let usdValValid = Double(usdVal.text!){
            currencies[Currency.EUR] = updateValues("USDEUR", value: usdValValid)
            eurVal.text = String(format: "%.2lf", currencies[Currency.EUR]!)
            currencies[Currency.GBP] = updateValues("USDGBP", value: usdValValid)
            gbpVal.text = String(format: "%.2lf", currencies[Currency.GBP]!)
        }
    }
    
    @IBAction func gbpValManChange(sender: AnyObject) {
        if let gbpValValid = Double(gbpVal.text!){
            currencies[Currency.EUR] = updateValues("GBPEUR", value: gbpValValid)
            eurVal.text = String(format: "%.2lf", currencies[Currency.EUR]!)
            currencies[Currency.USD] = updateValues("GBPUSD", value: gbpValValid)
            usdVal.text = String(format: "%.2lf", currencies[Currency.USD]!)
        }
    }
    
    func updateValues(convCall : String, value: Double) -> Double{
        return value * conversionRates[convCall]!
    }
    
    //updateRates
    @IBAction func updateRates(sender: AnyObject) {
        for currKey in conversionRates.keys{
            if let currCallRate = try? updateClass.updateRateFromYahoo(currKey){
                conversionRates[currKey] = currCallRate
            }
        }
        //update displays
        if let eurUsdRate = conversionRates["EURUSD"]{
            eurUsdConversionRate.text = String(eurUsdRate)
        }
        if let eurGbpRate = conversionRates["EURGBP"]{
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

    @IBAction func back(segue : UIStoryboardSegue){
        
    }

}