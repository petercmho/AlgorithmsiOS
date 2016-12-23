//
//  LSD.swift
//  AlgorithmsiOSLib
//
//  Created by Peter Ho on 2016-12-20.
//  Copyright © 2016 Peter Ho. All rights reserved.
//

import Foundation

class LSD {
    static func sort(_ a: [String], _ w: Int) {
        let n = a.count
        let r = 256     // extend ASCII alphabet size
        var aux = [String]()
        
        aux.reserveCapacity(n)
        
    }
    
    static func indexCount(_ a: inout [String], _ w: Int) -> Void {
        let n = a.count
        let r = 256
        
        for index in 1...w {
            var radix = Array<Int>(repeating: 0, count: 256 + 1)
            var aux = Array<String?>(repeating: nil, count: n)
            
            // Count frequency of each index key
            for i in 0..<n {
                let utf8Chars = a[i].utf8CString
                let char = utf8Chars[w - index]
                radix[Int(char) + 1] += 1
            }
            // Accumulate each index key
            for i in 1...r {
                radix[i] += radix[i-1]
            }
            // Move items based on key index
            for i in 0..<n {
                let char = a[i].utf8CString[w - index]
                aux[radix[Int(char)]] = a[i]
                radix[Int(char)] += 1
            }
            // Copy aux back to a
            for i in 0..<n {
                a[i] = aux[i]!
            }
        }
    }
}
