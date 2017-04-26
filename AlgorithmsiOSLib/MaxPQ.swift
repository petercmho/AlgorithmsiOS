//
//  MaxPQ.swift
//  AlgorithmsiOSLib
//
//  Created by Peter Ho on 2017-01-10.
//  Copyright © 2017 Peter Ho. All rights reserved.
//

import Foundation

protocol Init {
    init()
}

class MaxPQ<Key: Comparable>
where Key: Init {
    func insert(v: Key) {
        
    }
    func delMax() -> Key {
        return Key()
    }
}
