//
//  Hermite.swift
//  testRecursion
//
//  Created by Martin Nygren on 08/01/2017.
//  Copyright © 2017 Martin Nygren. All rights reserved.
//

import Foundation

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
