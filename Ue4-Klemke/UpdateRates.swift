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
        let sc = String(sellingCurrency.rawValue)
        let bc = String(buyingCurrency.rawValue)
        let currRateURL = NSURL(string: "https://download.finance.yahoo.com/d/quotes.csv?s=\(sc)\(bc)=X&f=a")

        do {
            let content = try NSString(contentsOfURL: currRateURL!, encoding: NSUTF8StringEncoding)
            return content.doubleValue
        } catch {
            print("Something went wrong when updating rates from Yahoo")
            throw CurrencyConversionError.CurrencyNotFound
        }
    }
    

}