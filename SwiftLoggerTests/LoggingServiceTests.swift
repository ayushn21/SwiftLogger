//
//  SwiftLoggerTests.swift
//  SwiftLoggerTests
//
//  Created by Ayush Newatia on 20/09/2015.
//  Copyright © 2015 Ayush Newatia. All rights reserved.
//

import XCTest
@testable import SwiftLogger

class LoggingServiceTests: XCTestCase {
    
    var mockLoggingService: MockLoggingService!
    
    override func setUp() {
        super.setUp()
        self.mockLoggingService = MockLoggingService()
    }
    
    override func tearDown() {
        super.tearDown()
        self.mockLoggingService = nil
    }
    
    func testInitialiser() {
        let loggingService = LoggingService()
        XCTAssertTrue(loggingService.logLevel == .Debug,
            "The default log level should be Debug")
        
        XCTAssertTrue(loggingService.dateFormatter.dateFormat == "dd-MM-yyyy HH:mm:ss.SSS",
            "The default date format should be correctly set")
    }
    
    // MARK: Testing Arrays
    
    func testFormatStringArray() {
        let stringArray = ["one", "two", "three", "four"]
        let output = mockLoggingService.formatCollectionAsString(stringArray)
        
        let expectedString = "\n\tone\n\ttwo\n\tthree\n\tfour\n"
        
        XCTAssert(output == expectedString)
    }
    
    func testFormatIntArray() {
        let intArray = [1, 2, 3, 4]
        let output = mockLoggingService.formatCollectionAsString(intArray)
        
        let expectedString = "\n\t1\n\t2\n\t3\n\t4\n"
        
        XCTAssert(output == expectedString)
    }
    
    func testFormatUIntArray() {
        let uintArray = [UInt(1), UInt(2), UInt(3), UInt(4)]
        let output = mockLoggingService.formatCollectionAsString(uintArray)
        
        let expectedString = "\n\t1\n\t2\n\t3\n\t4\n"
        
        XCTAssert(output == expectedString)
    }
    
    func testFormatFloatArray() {
        let floatArray = [Float(1.1), Float(2.2), Float(3.3), Float(4.4)]
        let output = mockLoggingService.formatCollectionAsString(floatArray)
        
        let expectedString = "\n\t1.1\n\t2.2\n\t3.3\n\t4.4\n"
        
        XCTAssert(output == expectedString)
    }
    
    func testFormatDoubleArray() {
        let doubleArray = [Double(1.1), Double(2.2), Double(3.3), Double(4.4)]
        let output = mockLoggingService.formatCollectionAsString(doubleArray)
        
        let expectedString = "\n\t1.1\n\t2.2\n\t3.3\n\t4.4\n"
        
        XCTAssert(output == expectedString)
    }

    // MARK: Testing Sets
    
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
    
    // MARK: Testing Strings
    
    func testFormatStringMessage() {
        let string = "some log message"
        let message = Message(string, level: "Debug", file: #file, function: #function, line: #line)
        
        let output = mockLoggingService.formatMessage(message)
        
        let expectedString = "\t[Debug]\tLoggingServiceTests.swift:138\ttestFormatStringMessage(): some log message"
        
        XCTAssert(output.containsString(expectedString))
    }
}
