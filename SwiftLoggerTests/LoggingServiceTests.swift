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
    
    func testInitialiser() {
        let loggingService = LoggingService()
        XCTAssertTrue(loggingService.logLevel == .Debug,
            "The default log level should be Debug")
        
        XCTAssertTrue(loggingService.dateFormatter.dateFormat == "dd-MM-yyyy HH:mm:ss.SSS",
            "The default date format should be correctly set")
    }
}
