//
//  DictionaryFormattingTests.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 08/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import XCTest
@testable import SwiftLogger

class DictionaryFormattingTests: BaseFormattingTests {
    
    func testFormatStringDict() {
        let stringDict = ["one" : "1", "two" : "2", "three" : "3", "four" : "4"]
        let output = mockLoggingService.formatCollectionAsString(stringDict)
        
        XCTAssert(output.containsString("\n\tone : 1"))
        XCTAssert(output.containsString("\n\ttwo : 2"))
        XCTAssert(output.containsString("\n\tthree : 3"))
        XCTAssert(output.containsString("\n\tfour : 4"))
    }
    
    func testFormatIntDict() {
        let intDict = ["one" : 1, "two" : 2, "three" : 3, "four" : 4]
        let output = mockLoggingService.formatCollectionAsString(intDict)
        
        XCTAssert(output.containsString("\n\tone : 1"))
        XCTAssert(output.containsString("\n\ttwo : 2"))
        XCTAssert(output.containsString("\n\tthree : 3"))
        XCTAssert(output.containsString("\n\tfour : 4"))
    }
    
    func testFormatUIntDict() {
        let uintDict: Dictionary<String, UInt> = ["one" : 1, "two" : 2, "three" : 3, "four" : 4]
        let output = mockLoggingService.formatCollectionAsString(uintDict)
        
        XCTAssert(output.containsString("\n\tone : 1"))
        XCTAssert(output.containsString("\n\ttwo : 2"))
        XCTAssert(output.containsString("\n\tthree : 3"))
        XCTAssert(output.containsString("\n\tfour : 4"))
    }
    
    func testFormatFloatDict() {
        let floatDict: Dictionary<String, Float> = ["one" : 1.1, "two" : 2.2, "three" : 3.3, "four" : 4.4]
        let output = mockLoggingService.formatCollectionAsString(floatDict)
        
        XCTAssert(output.containsString("\n\tone : 1.1"))
        XCTAssert(output.containsString("\n\ttwo : 2.2"))
        XCTAssert(output.containsString("\n\tthree : 3.3"))
        XCTAssert(output.containsString("\n\tfour : 4.4"))
    }
    
    func testFormatDoubleDict() {
        let doubleDict: Dictionary<String, Double> = ["one" : 1.1, "two" : 2.2, "three" : 3.3, "four" : 4.4]
        let output = mockLoggingService.formatCollectionAsString(doubleDict)
        
        XCTAssert(output.containsString("\n\tone : 1.1"))
        XCTAssert(output.containsString("\n\ttwo : 2.2"))
        XCTAssert(output.containsString("\n\tthree : 3.3"))
        XCTAssert(output.containsString("\n\tfour : 4.4"))
    }
}