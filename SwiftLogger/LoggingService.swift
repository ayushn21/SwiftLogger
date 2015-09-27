//
//  LoggingService.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 27/09/2015.
//  Copyright © 2015 Spectrum. All rights reserved.
//

public enum LogLevel: Int {
    case
    Off = -1,
    Info = 0,
    Debug,
    Warning,
    Error,
    Verbose
}

final class LoggingService {

    private let queue = NSOperationQueue()
    let dateFormatter = NSDateFormatter()
    
    var logLevel = LogLevel.Debug
    
    init() {
        queue.maxConcurrentOperationCount = 1;
        queue.qualityOfService = NSQualityOfService.Default
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss.SSS"
    }
    
    struct Message {
        let level: String
        let file: String
        let function: String
        let line: Int
        let message: String
        let timestamp: NSDate
        
        init(_ message:String,
            level: String,
            file:NSString,
            function:String,
            line:Int) {
                self.level = level
                self.file = file.lastPathComponent
                self.function = function
                self.line = line
                self.message = message
                self.timestamp = NSDate()
        }
    }

    
    func logMessage(message: Message) {
        queue.addOperationWithBlock { [unowned self] () -> Void in
            let dateString = self.dateFormatter.stringFromDate(message.timestamp)
            print("\(dateString)\t|\(message.level)|\t\(message.file):\(message.line)\t\(message.function) - \(message.message)")
        }
    }
    
    func setDateFormat(format: String) {
        dateFormatter.dateFormat = format
    }
}