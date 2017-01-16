//
//  main.swift
//  testRecursion
//
//  Created by Martin Nygren on 08/01/2017.
//  Copyright © 2017 Martin Nygren. All rights reserved.
//

import Foundation

print("Hello, World!")

var sTimebaseInfo = mach_timebase_info()
mach_timebase_info(&sTimebaseInfo)

let numer = UInt64(sTimebaseInfo.numer)
let denom = UInt64(sTimebaseInfo.denom)

let tStartRecursive = mach_absolute_time()

for var n in 3...30 {
    let _ = recursiveHermite(N: n, x: 0.1 * Double(n))
}

let tEndRecursive = mach_absolute_time()

let tStartImperative = mach_absolute_time()

for var n in 3...30 {
    let _ = imperativeHermite(N: n, x: 0.1 * Double(n))
}

let tEndImperative = mach_absolute_time()

let elapsedRecursive = ((tEndRecursive-tStartRecursive) * numer) / denom

let elapsedImperative = ((tEndImperative-tStartImperative) * numer) / denom

print("Calculating Hermite polynomials recursively took \(elapsedRecursive)ns")

print("Calculating Hermite polynomials imperatively took \(elapsedImperative)ns")
