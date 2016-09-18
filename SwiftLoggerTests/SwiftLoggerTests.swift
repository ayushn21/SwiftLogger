//
//  SwiftLoggerTests.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 30/09/2015.
//  Copyright © 2015 Ayush Newatia. All rights reserved.
//

import XCTest
@testable import SwiftLogger

class SwiftLoggerTests: XCTestCase {
 
    func testSettingTheLogLevel() {
        XCTAssertTrue(SwiftLogger.logLevel == .debug,
            "The default log level should be debug")
        
        SwiftLogger.logLevel = .verbose
        XCTAssertTrue(SwiftLogger.logLevel == .verbose,
            "The log level should correctly change to verbose")
    }
    
    func testSettingTheDateFormat() {
        SwiftLogger.dateFormat = "HH:mm"
        XCTAssertTrue(SwiftLogger.dateFormat == "HH:mm",
            "The date format should be set to the new value")
    }

}
