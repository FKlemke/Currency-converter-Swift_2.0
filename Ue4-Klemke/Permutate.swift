//
//  Permutate.swift
//  Ue4-Klemke
//
//  Created by Felix E.C. Klemke on 29/11/15.
//  Copyright © 2015 Klemke-Fiebig. All rights reserved.
//

//import Foundation
//
//class Permutate {
//    let N = 0
//    var p = [String]()
//    var count = 0
//    
//    init(p :[String]){
//    N = p.count
//    self.p = p
//    
//    }
//    
//    
//    func show() {
//        count++
//        print(NSString(format: "%5d: ", count))
//        
//        for i in 0..<N {
//            print(NSString(format: " %d", p[i]))
//        }
//        print("")
//    }
//    
//    var ok = [Bool](count: N + 1, repeatedValue: true)
//    
//    func put(pos: Int, k: Int) {
//        
//        p[pos] = k
//        
//        if pos == N - 1 {
//            show()
//        }
//        else {
//            ok[k] = false
//            for j in 1...N {
//                if ok[j] == true {
//                    put(pos + 1, j)
//                }
//            }
//            ok[k] = true
//        }
//    }
//    
//    func genperm1() {
//        count = 0
//        for k in 1...N {
//            put(0, k)
//        }
//    }
//    
//    genperm1()
//}

