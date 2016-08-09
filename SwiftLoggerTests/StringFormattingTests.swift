//
//  StringFormattingTests.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 08/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import XCTest
@testable import SwiftLogger

class StringFormattingTests: BaseFormattingTests {
    
    func testFormatStringMessage() {
        let string = "some log message"
        let message = Message(string, level: "Debug", file: #file, function: #function, line: #line)
        
        let output = mockLoggingService.formatMessage(message)
        
        let expectedString = "\t[Debug]\tStringFormattingTests.swift:16\ttestFormatStringMessage(): some log message"
        
        XCTAssert(output.contains(expectedString))
    }
}
