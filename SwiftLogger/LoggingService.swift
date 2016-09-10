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
    
    func logDictionary<Key: Loggable, Value:Loggable>
        (_ collection: Dictionary<Key, Value>, prefix: String, withMetadata metadata: MessageMetadata)
}

extension Logger {
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
                let messageString = collection.asString()
                let message = Message(prefix + messageString, metadata: metadata)
                print(self.formatMessage(message))
            }
    }
    
    func logDictionary<Key: Loggable, Value:Loggable>
        (_ dictionary: Dictionary<Key, Value>, prefix: String, withMetadata metadata: MessageMetadata) {
            consoleQueue.addOperation { [unowned self] () -> Void in
                let messageString = dictionary.asString()
                let message = Message(prefix + messageString, metadata: metadata)
                print(self.formatMessage(message))
            }
    }
}

// MARK: Utilities

extension Collection where Iterator.Element: Loggable {
    func asString() -> String {
        var messageString = "\n"
        for element in self {
            messageString = "\(messageString)\t\(element.log())\n"
        }
        return messageString
    }
}

extension Dictionary where Key: Loggable, Value: Loggable {
    func asString() -> String {
        var messageString = "\n"
        
        for (key, value) in self {
            messageString = "\(messageString)\t\(key.log()) : \(value.log())\n"
        }
        return messageString
    }
}
