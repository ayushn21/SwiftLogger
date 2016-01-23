//
//  LoggingService.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 27/09/2015.
//  Copyright © 2015 Ayush Newatia. All rights reserved.
//

struct Message {
    let body: String
    let metadata: MessageMetadata
    
    init(_ message:String,
        level: String,
        file:String,
        function:String,
        line:UInt) {
            self.body = message
            self.metadata = MessageMetadata(level: level, file: file, function: function, line: line)
    }
    
    init(_ message: String, metadata: MessageMetadata) {
        self.body = message
        self.metadata = metadata
    }
}

struct MessageMetadata {
    let level: String
    let file: String
    let function: String
    let line: UInt
    let timestamp: NSDate
    
    init(level: String,
        file: String,
        function: String,
        line: UInt) {
            self.level = level
            self.file = (file as NSString).lastPathComponent
            self.function = function
            self.line = line
            self.timestamp = NSDate()
    }
}

final class LoggingService {

    private let consoleQueue = NSOperationQueue()
    let dateFormatter = NSDateFormatter()
    
    var logLevel = SwiftLogger.LogLevel.Debug
    
    init() {
        consoleQueue.maxConcurrentOperationCount = 1;
        consoleQueue.qualityOfService = NSQualityOfService.Default
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss.SSS"
    }
    
    func logMessage(message: Message) {
        consoleQueue.addOperationWithBlock { [unowned self] () -> Void in
            print(self.formatMessage(message))
        }
    }
    
    func logCollection<T: CollectionType where T.Generator.Element: Loggable>
            (collection: T, withMetadata metadata: MessageMetadata) {
                
        consoleQueue.addOperationWithBlock { [unowned self] () -> Void in
            var messageString = "\n"
            for element in collection {
                messageString = "\(messageString)\t\(element.log())\n"
            }
            
            let message = Message(messageString, metadata: metadata)
            print(self.formatMessage(message))
        }
    }
    
    private func formatMessage(message: Message) -> String {
        let dateString = self.dateFormatter.stringFromDate(message.metadata.timestamp)
        return "\(dateString)\t[\(message.metadata.level)]\t\(message.metadata.file):\(message.metadata.line)\t\(message.metadata.function): \(message.body)"
    }
}