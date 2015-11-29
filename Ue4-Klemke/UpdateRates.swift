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
        let currRateURL = NSURL(string: "https://download.finance.yahoo.com/d/quotes.csv?s=\(sellingCurrency)\(buyingCurrency)=X&f=a")

        do {
            let content = try NSString(contentsOfURL: currRateURL!, encoding: NSUTF8StringEncoding)
            return content.doubleValue
        } catch {
            print("Something went wrong when updating rates from Yahoo")
            throw CurrencyConversionError.CurrencyNotFound
        }
    }
    
    func updateRateFromYahoo(currCall : String) throws -> Double{
        let currRateURL = NSURL(string: "https://download.finance.yahoo.com/d/quotes.csv?s=\(currCall)=X&f=a")
        
        do {
            let content = try NSString(contentsOfURL: currRateURL!, encoding: NSUTF8StringEncoding)
            return content.doubleValue
        } catch {
            print("Something went wrong when updating rates from Yahoo")
            throw CurrencyConversionError.CurrencyNotFound
        }
    }
    

}