//
//  SwiftLogger.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 27/09/2015.
//  Copyright © 2015 Ayush Newatia. All rights reserved.
//

/// Static class containing utilities to set Logging settings
public class SwiftLogger {
    
    static var service: Logger = LoggingService()
    
    /**
     Enum with the 6 possible log levels. In ascending order, the levels are:
     
     1) **Off**: Turn all logging off
     2) **Error**: Include error messages
     3) **Warning**: Include warnings
     4) **Info**: Log info messages only
     5) **Debug**: Include debug messages as well
     6) **Verbose**: Include literally every log message
     
     Only log messages that are less than or equal to the set log level will be printed to the console.
     */
    public enum LogLevel: Int {
        case
        off = -1,
        error = 0,
        warning,
        info,
        debug,
        verbose
    }
    
    /**
     Get or Set the desired log level.
     
     - parameter logLevel :A value of `SwiftLogger.LogLevel`
     */
    public class var logLevel:LogLevel {
        get {
            return SwiftLogger.service.logLevel
        }
        set {
            SwiftLogger.service.logLevel = newValue
        }
    }
    
    /**
     Get or Set the date format for the timestamp in the log message
     
     - parameter dateFormat :A string representing a date format that will be set on an `NSDateFormatter`
     */
    
    public class var dateFormat:String {
        get {
            return SwiftLogger.service.dateFormatter.dateFormat
        }
        set {
            SwiftLogger.service.dateFormatter.dateFormat = newValue
        }
    }
}

/// Static class containing all the logging methods
final public class Log {
    
    // MARK: String Logging
    
    /**
     Log an *error* message. Use this to log information about something that has gone wrong.
     
     - parameter message :A string for the log message
     */
    public class func error(
        _ message: Loggable,
        file: String = #file,
        function: String = #function,
        line: UInt = #line) {
        if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.error.rawValue {
            let message = Message(message.log(), level: "Error", file: file, function: function, line: line)
            SwiftLogger.service.logMessage(message)
        }
    }
    
    /**
     Log a *warning* message. Use this to log a message if something might go wrong in your program's execution
     
     - parameter message :A string for the log message
     */
    public class func warning(
        _ message: Loggable,
        file: String = #file,
        function: String = #function,
        line: UInt = #line) {
        if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.warning.rawValue {
            let message = Message(message.log(), level: "Warning", file: file, function: function, line: line)
            SwiftLogger.service.logMessage(message)
        }
    }
    
    /**
     Log an *info* message. Use this sparingly for general information to avoid clogging up your logs.
     
     - parameter message :A string for the log message
     */
    public class func info(
        _ message: Loggable,
        file: String = #file,
        function: String = #function,
        line: UInt = #line) {
        if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.info.rawValue {
            let message = Message(message.log(), level: "Info", file: file, function: function, line: line)
            SwiftLogger.service.logMessage(message)
        }
    }
    
    /**
     Log a *debug* message. Use this to log anything that might be useful for debugging.
     
     - parameter message :A string for the log message
     */
    public class func debug(
        _ message: Loggable,
        file: String = #file,
        function: String = #function,
        line: UInt = #line) {
        if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.debug.rawValue {
            let message = Message(message.log(), level: "Debug", file: file, function: function, line: line)
            SwiftLogger.service.logMessage(message)
        }
    }
    
    /**
     Log a *verbose* message. Use this to provide fine grained message about the code path executed by your program.
     
     - parameter message :A string for the log message
     */
    public class func verbose(
        _ message: Loggable,
        file: String = #file,
        function: String = #function,
        line: UInt = #line) {
        if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.verbose.rawValue {
            let message = Message(message.log(), level: "Verbose", file: file, function: function, line: line)
            SwiftLogger.service.logMessage(message)
        }
    }
    
    // MARK: Collection Logging
    
    /**
     Log a collection at *error* level. Use this to log information about something that has gone wrong.
     
     - parameter collection :A `CollectionType` of `Loggable` objects
     - parameter prefix :A `Loggable` which will be printed just before the collection (Optional)
     */
    public class func error<T: Collection>
        (_ collection: T,
         prefix: Loggable = "",
         file: String = #file,
         function: String = #function,
         line: UInt = #line)
        
        where T.Iterator.Element: Loggable {
            
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.error.rawValue {
                let metadata = MessageMetadata(level: "Error", file: file, function: function, line: line)
                SwiftLogger.service.logCollection(collection, prefix: prefix.log(), withMetadata: metadata)
            }
    }
    
    /**
     Log a collection at *warning* level. Use this to log a collection if something might go wrong in your program's execution
     
     - parameter collection :A `CollectionType` of `Loggable` objects
     - parameter prefix :A `Loggable` which will be printed just before the collection (Optional)
     */
    public class func warning<T: Collection>
        (_ collection: T,
         prefix: Loggable = "",
         file: String = #file,
         function: String = #function,
         line: UInt = #line)
        
        where T.Iterator.Element: Loggable {
            
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.warning.rawValue {
                let metadata = MessageMetadata(level: "Warning", file: file, function: function, line: line)
                SwiftLogger.service.logCollection(collection, prefix: prefix.log(), withMetadata: metadata)
            }
    }
    
    /**
     Log a collection at *info* level. Use this sparingly for general information to avoid clogging up your logs.
     
     - parameter collection :A `CollectionType` of `Loggable` objects
     - parameter prefix :A `Loggable` which will be printed just before the collection (Optional)
     */
    public class func info<T: Collection>
        (_ collection: T,
         prefix: Loggable = "",
         file: String = #file,
         function: String = #function,
         line: UInt = #line)
        
        where T.Iterator.Element: Loggable {
            
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.info.rawValue {
                let metadata = MessageMetadata(level: "Info", file: file, function: function, line: line)
                SwiftLogger.service.logCollection(collection, prefix: prefix.log(), withMetadata: metadata)
            }
    }
    
    /**
     Log a collection at *debug* level. Use this to log anything that might be useful for debugging.
     
     - parameter collection :A `CollectionType` of `Loggable` objects
     - parameter prefix :A `Loggable` which will be printed just before the collection (Optional)
     */
    public class func debug<T: Collection>
        (_ collection: T,
         prefix: Loggable = "",
         file: String = #file,
         function: String = #function,
         line: UInt = #line)
        
        where T.Iterator.Element: Loggable {
            
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.debug.rawValue {
                let metadata = MessageMetadata(level: "Debug", file: file, function: function, line: line)
                SwiftLogger.service.logCollection(collection, prefix: prefix.log(), withMetadata: metadata)
            }
    }
    
    /**
     Log a collection at *verbose* level. Use this to provide fine grained message about the code path executed by your program.
     
     - parameter collection :A `CollectionType` of `Loggable` objects
     - parameter prefix :A `Loggable` which will be printed just before the collection (Optional)
     */
    public class func verbose<T: Collection>
        (_ collection: T,
         prefix: Loggable = "",
         file: String = #file,
         function: String = #function,
         line: UInt = #line)
        
        where T.Iterator.Element: Loggable {
            
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.verbose.rawValue {
                let metadata = MessageMetadata(level: "Verbose", file: file, function: function, line: line)
                SwiftLogger.service.logCollection(collection, prefix: prefix.log(), withMetadata: metadata)
            }
    }
    
    // MARK: Dictionary Logging
    
    /**
     Log a dictionary at *warning* level. Use this to provide fine grained message about the code path executed by your program.
     
     - parameter dictionary :A `Dictionary` where the key and value conform to `Loggable`
     - parameter prefix :A `Loggable` which will be printed just before the collection (Optional)
     */
    public class func error<Key: Loggable, Value: Loggable>
        (_ collection: Dictionary<Key, Value>,
         prefix: Loggable = "",
         file: String = #file,
         function: String = #function,
         line: UInt = #line) {
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.error.rawValue {
                let metadata = MessageMetadata(level: "Error", file: file, function: function, line: line)
                SwiftLogger.service.logDictionary(collection, prefix: prefix.log(), withMetadata: metadata)
            }
    }
    
    /**
     Log a dictionary at *warning* level. Use this to provide fine grained message about the code path executed by your program.
     
     - parameter dictionary :A `Dictionary` where the key and value conform to `Loggable`
     - parameter prefix :A `Loggable` which will be printed just before the collection (Optional)
     */
    public class func warning<Key: Loggable, Value: Loggable>
        (_ dictionary: Dictionary<Key, Value>,
         prefix: Loggable = "",
         file: String = #file,
         function: String = #function,
         line: UInt = #line) {
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.warning.rawValue {
                let metadata = MessageMetadata(level: "Warning", file: file, function: function, line: line)
                SwiftLogger.service.logDictionary(dictionary, prefix: prefix.log(), withMetadata: metadata)
            }
    }
    
    /**
     Log a dictionary at *info* level. Use this to provide fine grained message about the code path executed by your program.
     
     - parameter dictionary :A `Dictionary` where the key and value conform to `Loggable`
     - parameter prefix :A `Loggable` which will be printed just before the collection (Optional)
     */
    public class func info<Key: Loggable, Value: Loggable>
        (_ dictionary: Dictionary<Key, Value>,
         prefix: Loggable = "",
         file: String = #file,
         function: String = #function,
         line: UInt = #line) {
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.info.rawValue {
                let metadata = MessageMetadata(level: "Info", file: file, function: function, line: line)
                SwiftLogger.service.logDictionary(dictionary, prefix: prefix.log(), withMetadata: metadata)
            }
    }
    
    /**
     Log a dictionary at *debug* level. Use this to provide fine grained message about the code path executed by your program.
     
     - parameter dictionary :A `Dictionary` where the key and value conform to `Loggable`
     - parameter prefix :A `Loggable` which will be printed just before the collection (Optional)
     */
    public class func debug<Key: Loggable, Value: Loggable>
        (_ dictionary: Dictionary<Key, Value>,
         prefix: Loggable = "",
         file: String = #file,
         function: String = #function,
         line: UInt = #line) {
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.debug.rawValue {
                let metadata = MessageMetadata(level: "Debug", file: file, function: function, line: line)
                SwiftLogger.service.logDictionary(dictionary, prefix: prefix.log(), withMetadata: metadata)
            }
    }
    
    /**
     Log a dictionary at *verbose* level. Use this to provide fine grained message about the code path executed by your program.
     
     - parameter dictionary :A `Dictionary` where the key and value conform to `Loggable`
     - parameter prefix :A `Loggable` which will be printed just before the collection (Optional)
     */
    public class func verbose<Key: Loggable, Value: Loggable>
        (_ dictionary: Dictionary<Key, Value>,
         prefix: Loggable = "",
         file: String = #file,
         function: String = #function,
         line: UInt = #line) {
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.verbose.rawValue {
                let metadata = MessageMetadata(level: "Verbose", file: file, function: function, line: line)
                SwiftLogger.service.logDictionary(dictionary, prefix: prefix.log(), withMetadata: metadata)
            }
    }
}
