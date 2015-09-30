//
//  SwiftLoggerTests.swift
//  SwiftLoggerTests
//
//  Created by Ayush Newatia on 20/09/2015.
//  Copyright © 2015 Spectrum. All rights reserved.
//

import XCTest
@testable import SwiftLogger

class LoggingServiceTests: XCTestCase {
    
    var loggingService: LoggingService!
    
    override func setUp() {
        super.setUp()
        self.loggingService = LoggingService()
    }
    
    override func tearDown() {
        super.tearDown()
        self.loggingService = nil
    }
    
    func testInitialiser() {
        XCTAssertTrue(self.loggingService.logLevel == SwiftLogger.LogLevel.Debug,
            "The default log level should be Debug")
        
        XCTAssertTrue(self.loggingService.dateFormatter.dateFormat == "dd-MM-yyyy HH:mm:ss.SSS",
            "The default date format should be correctly set")
    }
    
    func testMessageInitialiser() {
        let file: NSString = __FILE__
        let function = __FUNCTION__
        let line = __LINE__
        
        let message = LoggingService.Message("test", level: "Debug", file: file, function: function, line: line)
        
        XCTAssertTrue(message.message == "test", "The log message should be correctly set")
        XCTAssertTrue(message.level == "Debug", "The log level string should be correctly set")
        XCTAssertTrue(message.file == file.lastPathComponent, "The file string should be correctly set")
        XCTAssertTrue(message.function == function, "The function string should be correctly set")
        XCTAssertTrue(message.line == line, "The line string should be correctly set")
        XCTAssertNotNil(message.timestamp, "The date should have been created with the object")    
    }
    
}
