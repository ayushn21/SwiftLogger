//
//  SetFormattingTests.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 08/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import XCTest
@testable import SwiftLogger

class SetFormattingTests: BaseFormattingTests {
    
    func testFormatStringSet() {
        let stringSet: Set<String> = ["one", "two", "three", "four"]
        let output = stringSet.asString()
        
        XCTAssert(output.contains("\n\tone"))
        XCTAssert(output.contains("\n\ttwo"))
        XCTAssert(output.contains("\n\tthree"))
        XCTAssert(output.contains("\n\tfour"))
    }
    
    func testFormatIntSet() {
        let intSet: Set<Int> = [1, 2, 3, 4]
        let output = intSet.asString()
        
        XCTAssert(output.contains("\n\t1"))
        XCTAssert(output.contains("\n\t2"))
        XCTAssert(output.contains("\n\t3"))
        XCTAssert(output.contains("\n\t4"))
    }
    
    func testFormatUIntSet() {
        let uintSet: Set<UInt> = [1, 2, 3, 4]
        let output = uintSet.asString()
        
        XCTAssert(output.contains("\n\t1"))
        XCTAssert(output.contains("\n\t2"))
        XCTAssert(output.contains("\n\t3"))
        XCTAssert(output.contains("\n\t4"))
    }
    
    func testFormatFloatSet() {
        let floatSet: Set<Float> = [1.1, 2.2, 3.3, 4.4]
        let output = floatSet.asString()
        
        XCTAssert(output.contains("\n\t1.1"))
        XCTAssert(output.contains("\n\t2.2"))
        XCTAssert(output.contains("\n\t3.3"))
        XCTAssert(output.contains("\n\t4.4"))
    }
    
    func testFormatDoubleSet() {
        let doubleSet: Set<Double> = [1.1, 2.2, 3.3, 4.4]
        let output = doubleSet.asString()
        
        XCTAssert(output.contains("\n\t1.1"))
        XCTAssert(output.contains("\n\t2.2"))
        XCTAssert(output.contains("\n\t3.3"))
        XCTAssert(output.contains("\n\t4.4"))
    }
}
