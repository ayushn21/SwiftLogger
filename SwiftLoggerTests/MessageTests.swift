//
//  MessageTests.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 15/07/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftLogger

class MessageTests: XCTestCase {
    
    func testMessageMetadataInitialiser() {
        let file: NSString = #file
        let function = #function
        let line = #line as UInt
        
        let metadata = MessageMetadata(level: "Debug", file: file as String, function: function, line: line)
        
        XCTAssertTrue(metadata.level == "Debug", "The log level string should be correctly set")
        XCTAssertTrue(metadata.file == file.lastPathComponent, "The file string should be correctly set")
        XCTAssertTrue(metadata.function == function, "The function string should be correctly set")
        XCTAssertTrue(metadata.line == line, "The line string should be correctly set")
        XCTAssertNotNil(metadata.timestamp, "The date should have been created with the object")
    }
    
    func testMessageInitialiser() {
        let file: NSString = #file
        let function = #function
        let line = #line as UInt
        
        let message = Message("test", level: "Debug", file: file as String, function: function, line: line)
        
        XCTAssertTrue(message.body == "test", "The log message should be correctly set")
        XCTAssertTrue(message.metadata.level == "Debug", "The log level string should be correctly set")
        XCTAssertTrue(message.metadata.file == file.lastPathComponent, "The file string should be correctly set")
        XCTAssertTrue(message.metadata.function == function, "The function string should be correctly set")
        XCTAssertTrue(message.metadata.line == line, "The line string should be correctly set")
        XCTAssertNotNil(message.metadata.timestamp, "The date should have been created with the object")
    }
    
    func testMessageInitialiserWithMetdata() {
        let file: NSString = #file
        let function = #function
        let line = #line as UInt
        
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