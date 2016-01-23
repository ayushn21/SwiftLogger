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
        XCTAssertTrue(self.loggingService.logLevel == .Debug,
            "The default log level should be Debug")
        
        XCTAssertTrue(self.loggingService.dateFormatter.dateFormat == "dd-MM-yyyy HH:mm:ss.SSS",
            "The default date format should be correctly set")
    }
    
    func testMessageMetadataInitialiser() {
        let file: NSString = __FILE__
        let function = __FUNCTION__
        let line = __LINE__ as UInt
        
        let metadata = MessageMetadata(level: "Debug", file: file as String, function: function, line: line)
        
        XCTAssertTrue(metadata.level == "Debug", "The log level string should be correctly set")
        XCTAssertTrue(metadata.file == file.lastPathComponent, "The file string should be correctly set")
        XCTAssertTrue(metadata.function == function, "The function string should be correctly set")
        XCTAssertTrue(metadata.line == line, "The line string should be correctly set")
        XCTAssertNotNil(metadata.timestamp, "The date should have been created with the object")
    }
    
    func testMessageInitialiser() {
        let file: NSString = __FILE__
        let function = __FUNCTION__
        let line = __LINE__ as UInt
        
        let message = Message("test", level: "Debug", file: file as String, function: function, line: line)
        
        XCTAssertTrue(message.body == "test", "The log message should be correctly set")
        XCTAssertTrue(message.metadata.level == "Debug", "The log level string should be correctly set")
        XCTAssertTrue(message.metadata.file == file.lastPathComponent, "The file string should be correctly set")
        XCTAssertTrue(message.metadata.function == function, "The function string should be correctly set")
        XCTAssertTrue(message.metadata.line == line, "The line string should be correctly set")
        XCTAssertNotNil(message.metadata.timestamp, "The date should have been created with the object")
    }
    
    func testMessageInitialiserWithMetdata() {
        let file: NSString = __FILE__
        let function = __FUNCTION__
        let line = __LINE__ as UInt
        
        let metadata = MessageMetadata(level: "Debug", file: file as String, function: function, line: line)
        let message = Message("test", metadata: metadata)
        
        XCTAssertTrue(message.body == "test", "The log message should be correctly set")
        XCTAssertTrue(message.metadata.level == "Debug", "The log level string should be correctly set")
        XCTAssertTrue(message.metadata.file == file.lastPathComponent, "The file string should be correctly set")
        XCTAssertTrue(message.metadata.function == function, "The function string should be correctly set")
        XCTAssertTrue(message.metadata.line == line, "The line string should be correctly set")
        XCTAssertNotNil(message.metadata.timestamp, "The date should have been created with the object")
    }
}
