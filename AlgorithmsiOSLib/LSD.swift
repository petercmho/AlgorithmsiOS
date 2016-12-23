//
//  LSD.swift
//  AlgorithmsiOSLib
//
//  Created by Peter Ho on 2016-12-20.
//  Copyright © 2016 Peter Ho. All rights reserved.
//

import Foundation

class LSD {
    // LSD radix sort
    static func indexCount(_ a: inout [String], _ w: Int) {
        let n = a.count
        let r = 256
        
        for index in 1...w {
            var radix = Array<Int>(repeating: 0, count: r + 1)
            var aux = Array<String?>(repeating: nil, count: n)
            
            // Compute frequency counts
            for i in 0..<n {
                let utf8Chars = a[i].utf8CString
                let char = utf8Chars[w - index]
                radix[Int(char) + 1] += 1
            }
            // Compute cumulates
            for i in 1...r {
                radix[i] += radix[i-1]
            }
            // Move data
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
