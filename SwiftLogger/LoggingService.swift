//
//  LoggingService.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 27/09/2015.
//  Copyright © 2015 Ayush Newatia. All rights reserved.
//


protocol Logger {
    var logLevel: SwiftLogger.LogLevel { get set }
    var dateFormatter: DateFormatter { get }
    
    func logMessage(_ message: Message)
    
    func logCollection<T: Collection>
        (_ collection: T, prefix: String, withMetadata metadata: MessageMetadata)
    where T.Iterator.Element: Loggable
    
    func logCollection<Key:Loggable, Value: Loggable, T: Collection>
        (_ collection: T, prefix: String, withMetadata metadata: MessageMetadata)
    where T.Iterator.Element == (Key, Value)
}

extension Logger {
    func formatCollectionAsString<T: Collection> (_ collection: T) -> String
        where T.Iterator.Element: Loggable {
            var messageString = "\n"
            for element in collection {
                messageString = "\(messageString)\t\(element.log())\n"
            }
            return messageString
    }
    
    func formatCollectionAsString<Key:Loggable, Value: Loggable, T: Collection>
        (_ collection: T) -> String
        where T.Iterator.Element == (Key, Value) {
            
            var messageString = "\n"
            
            for element in collection {
                messageString = "\(messageString)\t\(element.0.log()) : \(element.1.log())\n"
            }
            return messageString
    }
    
    func formatMessage(_ message: Message) -> String {
        let dateString = self.dateFormatter.string(from: message.metadata.timestamp as Date)
        return "\(dateString)\t[\(message.metadata.level)]\t\(message.metadata.file):\(message.metadata.line)\t\(message.metadata.function): \(message.body)"
    }
}

final class LoggingService: Logger {
    
    let dateFormatter = DateFormatter()
    var logLevel = SwiftLogger.LogLevel.debug
    
    private let consoleQueue = OperationQueue()
    
    init() {
        consoleQueue.maxConcurrentOperationCount = 1;
        consoleQueue.qualityOfService = QualityOfService.default
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss.SSS"
    }
    
    func logMessage(_ message: Message) {
        consoleQueue.addOperation { [unowned self] () -> Void in
            print(self.formatMessage(message))
        }
    }
    
    func logCollection<T: Collection>
        (_ collection: T, prefix: String, withMetadata metadata: MessageMetadata)
        where T.Iterator.Element: Loggable {
            
            consoleQueue.addOperation { [unowned self] () -> Void in
                let messageString = self.formatCollectionAsString(collection)
                let message = Message(prefix + messageString, metadata: metadata)
                print(self.formatMessage(message))
            }
    }
    
    func logCollection<Key:Loggable, Value: Loggable, T: Collection>
        (_ collection: T, prefix: String, withMetadata metadata: MessageMetadata)
        where T.Iterator.Element == (Key, Value) {
            consoleQueue.addOperation { [unowned self] () -> Void in
                let messageString = self.formatCollectionAsString(collection)
                let message = Message(prefix + messageString, metadata: metadata)
                print(self.formatMessage(message))
            }
    }
}
