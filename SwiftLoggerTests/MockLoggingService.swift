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
    
    let dateFormatter = DateFormatter()
    var logLevel = SwiftLogger.LogLevel.debug
    
    init() {
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss.SSS"
    }
    
    func logMessage(_ message: Message) {}
    
    func logCollection<T: Collection>
        (_ collection: T, prefix: String, withMetadata metadata: MessageMetadata)
        where T.Iterator.Element: Loggable {}
    
    func logDictionary<Key: Loggable, Value:Loggable>
        (_ collection: Dictionary<Key, Value>, prefix: String, withMetadata metadata: MessageMetadata) {}
}
