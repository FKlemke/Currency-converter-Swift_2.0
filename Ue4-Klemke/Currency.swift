//
//  Currency.swift
//  Ue4-Klemke
//
//  Created by Felix E.C. Klemke on 28/11/15.
//  Copyright © 2015 Klemke-Fiebig. All rights reserved.
//

import Foundation

class Currency {
    let name: String
    let currCode: String
    var value: Double
    
    init(name: String, currCode: String, value: Double){
        self.name = name
        self.currCode = currCode
        self.value = value
    }
}