//
//  LoggingService.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 27/09/2015.
//  Copyright © 2015 Ayush Newatia. All rights reserved.
//


protocol Logger {
    var logLevel: SwiftLogger.LogLevel { get set }
    var dateFormatter: NSDateFormatter { get }
    
    func logMessage(message: Message)
    func logCollection<T: CollectionType where T.Generator.Element: Loggable>
        (collection: T, withMetadata metadata: MessageMetadata)
}

extension Logger {
    func formatCollectionAsString<T: CollectionType where T.Generator.Element: Loggable>
        (collection: T) -> String {
            var messageString = "\n"
            for element in collection {
                messageString = "\(messageString)\t\(element.log())\n"
            }
            return messageString
    }
    
    func formatMessage(message: Message) -> String {
        let dateString = self.dateFormatter.stringFromDate(message.metadata.timestamp)
        return "\(dateString)\t[\(message.metadata.level)]\t\(message.metadata.file):\(message.metadata.line)\t\(message.metadata.function): \(message.body)"
    }

}

final class LoggingService: Logger {

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
            let messageString = self.formatCollectionAsString(collection)
            let message = Message(messageString, metadata: metadata)
            print(self.formatMessage(message))
        }
    }
}