//
//  LoggingService.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 27/09/2015.
//  Copyright © 2015 Spectrum. All rights reserved.
//

final class LoggingService {

    private let consoleQueue = NSOperationQueue()
    private let fileQueue = NSOperationQueue()
    let dateFormatter = NSDateFormatter()
    
    var logLevel = SwiftLogger.LogLevel.Debug
    
    init() {
        consoleQueue.maxConcurrentOperationCount = 1;
        consoleQueue.qualityOfService = NSQualityOfService.Default
        fileQueue.maxConcurrentOperationCount = 1;
        fileQueue.qualityOfService = NSQualityOfService.Default
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
        consoleQueue.addOperationWithBlock { [unowned self] () -> Void in
            print(self.formatMessage(message))
        }
    }
    
    private func formatMessage(message: Message) -> String {
        let dateString = self.dateFormatter.stringFromDate(message.timestamp)
        return "\(dateString)\t[\(message.level)]\t\(message.file):\(message.line)\t\(message.function): \(message.message)"
    }
}