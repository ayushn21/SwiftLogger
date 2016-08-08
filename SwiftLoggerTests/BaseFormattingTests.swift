//
//  BaseFormattingTests.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 08/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import XCTest

class BaseFormattingTests: XCTestCase {
    var mockLoggingService: MockLoggingService!
    
    override func setUp() {
        super.setUp()
        self.mockLoggingService = MockLoggingService()
    }
    
    override func tearDown() {
        super.tearDown()
        self.mockLoggingService = nil
    }
}