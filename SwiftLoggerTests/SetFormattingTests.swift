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
        let stringSet = Set(["one", "two", "three", "four"])
        let output = mockLoggingService.formatCollectionAsString(stringSet)
        
        XCTAssert(output.containsString("\n\tone"))
        XCTAssert(output.containsString("\n\ttwo"))
        XCTAssert(output.containsString("\n\tthree"))
        XCTAssert(output.containsString("\n\tfour"))
    }
    
    func testFormatIntSet() {
        let intSet = Set([1, 2, 3, 4])
        let output = mockLoggingService.formatCollectionAsString(intSet)
        
        XCTAssert(output.containsString("\n\t1"))
        XCTAssert(output.containsString("\n\t2"))
        XCTAssert(output.containsString("\n\t3"))
        XCTAssert(output.containsString("\n\t4"))
    }
    
    func testFormatUIntSet() {
        let uintSet = Set<UInt>([1, 2, 3, 4])
        let output = mockLoggingService.formatCollectionAsString(uintSet)
        
        XCTAssert(output.containsString("\n\t1"))
        XCTAssert(output.containsString("\n\t2"))
        XCTAssert(output.containsString("\n\t3"))
        XCTAssert(output.containsString("\n\t4"))
    }
    
    func testFormatFloatSet() {
        let floatSet = Set<Float>([1.1, 2.2, 3.3, 4.4])
        let output = mockLoggingService.formatCollectionAsString(floatSet)
        
        XCTAssert(output.containsString("\n\t1.1"))
        XCTAssert(output.containsString("\n\t2.2"))
        XCTAssert(output.containsString("\n\t3.3"))
        XCTAssert(output.containsString("\n\t4.4"))
    }
    
    func testFormatDoubleSet() {
        let doubleSet = Set<Double>([1.1, 2.2, 3.3, 4.4])
        let output = mockLoggingService.formatCollectionAsString(doubleSet)
        
        XCTAssert(output.containsString("\n\t1.1"))
        XCTAssert(output.containsString("\n\t2.2"))
        XCTAssert(output.containsString("\n\t3.3"))
        XCTAssert(output.containsString("\n\t4.4"))
    }
}