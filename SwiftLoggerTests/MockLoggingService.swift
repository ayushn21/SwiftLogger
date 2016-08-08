//
//  MockLoggingService.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 08/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import Foundation
@testable import SwiftLogger

final class MockLoggingService: Logger {
    
    let dateFormatter = NSDateFormatter()
    var logLevel = SwiftLogger.LogLevel.Debug
    
    init() {
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss.SSS"
    }
    
    func logMessage(message: Message) {}
    
    func logCollection<T: CollectionType where T.Generator.Element: Loggable>
        (collection: T, withMetadata metadata: MessageMetadata) {}
}