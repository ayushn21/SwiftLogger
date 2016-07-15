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
}
