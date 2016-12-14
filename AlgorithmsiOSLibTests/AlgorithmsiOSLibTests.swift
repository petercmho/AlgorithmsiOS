//
//  AlgorithmsiOSLibTests.swift
//  AlgorithmsiOSLibTests
//
//  Created by Peter Ho on 2016-12-13.
//  Copyright © 2016 Peter Ho. All rights reserved.
//

import XCTest
@testable import AlgorithmsiOSLib

class AlgorithmsiOSLibTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func queueTest() {
        let intQueue = Queue<Int>()
        
        XCTAssertTrue(intQueue.isEmpty())
        
        intQueue.enqueue(item: 5)
        intQueue.enqueue(item: 6)
        intQueue.enqueue(item: 1)
        intQueue.enqueue(item: 10)
        
        XCTAssertFalse(intQueue.isEmpty())
        XCTAssert(intQueue.dequeue() == 5)
        XCTAssert(intQueue.dequeue() == 6)
        XCTAssert(intQueue.dequeue() == 1)
        XCTAssert(intQueue.dequeue() == 10)
        
        XCTAssertTrue(intQueue.isEmpty())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
