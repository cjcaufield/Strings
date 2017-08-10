//
//  StringsTests.swift
//  StringsTests
//
//  Created by Colin Caufield on 2017-02-16.
//  Copyright © 2017 Secret Geometry, Inc. All rights reserved.
//

import XCTest

class StringsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testModels() {
        
        let x: ChromaticNote = 7
        print(x)
        
        let y: DiatonicNote = 5
        print(y)
        
        let xs: [ChromaticNote] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        print(xs)
        
        let ys: [DiatonicNote] = [1, b2, 2, b3, 3, 4, b5, 5, b6, 6, b7, 7]
        print(ys)
        
        for i in 0 ..< 24 {
            
            let c = ChromaticNote(i)
            print("Chromatic \(c)")
            
            let d = DiatonicNote(chromaticNote: c)
            print("Diatonic \(d)")
        }
        
        let p1: Progression = [I, IV, V, I]
        print(p1)
        
        let p2: Progression = [I, ii, iii, IV, V, vi, viidim]
        print(p2)
        
        XCTAssert(1 == 1)
    }
}
