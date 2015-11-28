//
//  UpdateRates.swift
//  Ue4-Klemke
//
//  Created by Felix E.C. Klemke on 28/11/15.
//  Copyright © 2015 Klemke-Fiebig. All rights reserved.
//

import Foundation

enum CurrencyConversionError: ErrorType {
    case CurrencyNotFound
}

class UpdateRates {
    
    
    func updateRateFromYahoo(sellingCurrency: Currency, buyingCurrency: Currency) throws -> Double{
        
        let currRateURL = NSURL(string: "https://download.finance.yahoo.com/d/quotes.csv?s=\(sellingCurrency.currCode)\(buyingCurrency.currCode)=X&f=a")
        do {
            let content = try NSString(contentsOfURL: currRateURL!, encoding: NSUTF8StringEncoding)
            return sellingCurrency.value * content.doubleValue
        } catch {
            throw CurrencyConversionError.CurrencyNotFound
        }
    }
    

}