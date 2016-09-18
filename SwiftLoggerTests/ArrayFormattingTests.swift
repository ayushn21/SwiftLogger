//
//  ArrayFormattingTests.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 08/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import XCTest
@testable import SwiftLogger

class ArrayFormattingTests: BaseFormattingTests {
    
    func testFormatStringArray() {
        let stringArray = ["one", "two", "three", "four"]
        let output = stringArray.asString()
        
        let expectedString = "\n\tone\n\ttwo\n\tthree\n\tfour\n"
        
        XCTAssert(output == expectedString)
    }
    
    func testFormatIntArray() {
        let intArray = [1, 2, 3, 4]
        let output = intArray.asString()
        
        let expectedString = "\n\t1\n\t2\n\t3\n\t4\n"
        
        XCTAssert(output == expectedString)
    }
    
    func testFormatUIntArray() {
        let uintArray = [UInt(1), UInt(2), UInt(3), UInt(4)]
        let output = uintArray.asString()
        
        let expectedString = "\n\t1\n\t2\n\t3\n\t4\n"
        
        XCTAssert(output == expectedString)
    }
    
    func testFormatFloatArray() {
        let floatArray = [Float(1.1), Float(2.2), Float(3.3), Float(4.4)]
        let output = floatArray.asString()
        
        let expectedString = "\n\t1.1\n\t2.2\n\t3.3\n\t4.4\n"
        
        XCTAssert(output == expectedString)
    }
    
    func testFormatDoubleArray() {
        let doubleArray = [Double(1.1), Double(2.2), Double(3.3), Double(4.4)]
        let output = doubleArray.asString()
        
        let expectedString = "\n\t1.1\n\t2.2\n\t3.3\n\t4.4\n"
        
        XCTAssert(output == expectedString)
    }
}
