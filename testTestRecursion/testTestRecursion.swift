//
//  testTestRecursion.swift
//  testTestRecursion
//
//  Created by Martin Nygren on 08/01/2017.
//  Copyright © 2017 Martin Nygren. All rights reserved.
//

import XCTest
@testable import testRecursion

func recursiveHermite(N: Int, x: Double) -> Double {
    switch N {
    case 0:
        return 1.0
    case 1:
        return 2.0 * x
    default:
        return 2.0 * x * recursiveHermite(N: N-1, x: x) - 2.0 * Double(N) * recursiveHermite(N: N-2, x: x)
    }
}

func imperativeHermite(N: Int, x: Double) -> Double {
    switch N {
    case 0:
        return 1.0
    case 1:
        return 2.0 * x
    default:
        var hMinusTwo = 1.0
        var hMinusOne = 2.0 * x
        var h = 0.0
        for i in (2...N) {
            h = 2.0 * x * hMinusOne - 2.0 * Double(i) * hMinusTwo
            hMinusTwo = hMinusOne
            hMinusOne = h
        }
        
        return h
    }
}

class testTestRecursion: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSomeValues() {
        XCTAssertEqual(recursiveHermite(N: 0, x: 0), 1)
        XCTAssertEqual(recursiveHermite(N: 1, x: 0), 0)
        XCTAssertEqual(recursiveHermite(N: 5, x: 3.4), imperativeHermite(N: 5, x: 3.4))
    }
    
    func testRecursivePerformance() {
        // This is an example of a performance test case.
        self.measure {
            recursiveHermite(N: 36, x: 5.6)
        }
    }
    
    func testImperativePerformance() {
        // This is an example of a performance test case.
        self.measure {
            let _ = imperativeHermite(N: 36, x: 5.6)
        }
    }
}
