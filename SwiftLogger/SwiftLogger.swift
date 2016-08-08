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
        Off = -1,
        Error = 0,
        Warning,
        Info,
        Debug,
        Verbose
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
public class Log {
    
    // MARK: String Logging
    
    /**
        Log an *error* message. Use this to log information about something that has gone wrong.
    
        - parameter message :A string for the log message
    */
    public class func error(
        message: Loggable,
        file: String = #file,
        function: String = #function,
        line: UInt = #line) {
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.Error.rawValue {
                let message = Message(message.log(), level: "Error", file: file, function: function, line: line)
                SwiftLogger.service.logMessage(message)
            }
    }

    /**
        Log a *warning* message. Use this to log a message if something might go wrong in your program's execution
     
        - parameter message :A string for the log message
     */
    public class func warning(
        message: Loggable,
        file: String = #file,
        function: String = #function,
        line: UInt = #line) {
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.Warning.rawValue {
                let message = Message(message.log(), level: "Warning", file: file, function: function, line: line)
                SwiftLogger.service.logMessage(message)
            }
    }

    /**
        Log an *info* message. Use this sparingly for general information to avoid clogging up your logs.
    
        - parameter message :A string for the log message
    */
    public class func info(
        message: Loggable,
        file: String = #file,
        function: String = #function,
        line: UInt = #line) {
        if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.Info.rawValue {
            let message = Message(message.log(), level: "Info", file: file, function: function, line: line)
            SwiftLogger.service.logMessage(message)
        }
    }
    
    /**
        Log a *debug* message. Use this to log anything that might be useful for debugging.
    
        - parameter message :A string for the log message
    */
    public class func debug(
        message: Loggable,
        file: String = #file,
        function: String = #function,
        line: UInt = #line) {
        if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.Debug.rawValue {
            let message = Message(message.log(), level: "Debug", file: file, function: function, line: line)
            SwiftLogger.service.logMessage(message)
        }
    }
    
    /**
        Log a *verbose* message. Use this to provide fine grained message about the code path executed by your program.
    
        - parameter message :A string for the log message
    */
    public class func verbose(
        message: Loggable,
        file: String = #file,
        function: String = #function,
        line: UInt = #line) {
        if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.Verbose.rawValue {
            let message = Message(message.log(), level: "Verbose", file: file, function: function, line: line)
            SwiftLogger.service.logMessage(message)
        }
    }
    
    // MARK: Collection Logging
    
    /**
        Log a collection at *error* level. Use this to log information about something that has gone wrong.
    
        - parameter collection :A `CollectionType` of `Loggable` objects
    */
    public class func error<T: CollectionType where T.Generator.Element: Loggable>(
        collection: T,
        prefix: Loggable = "",
        file: String = #file,
        function: String = #function,
        line: UInt = #line) {
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.Error.rawValue {
                let metadata = MessageMetadata(level: "Error", file: file, function: function, line: line)
                SwiftLogger.service.logCollection(collection, prefix: prefix.log(), withMetadata: metadata)
            }
    }
    
    /**
        Log a collection at *warning* level. Use this to log a collection if something might go wrong in your program's execution
     
        - parameter collection :A `CollectionType` of `Loggable` objects
     */
    public class func warning<T: CollectionType where T.Generator.Element: Loggable>(
        collection: T,
        prefix: Loggable = "",
        file: String = #file,
        function: String = #function,
        line: UInt = #line) {
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.Warning.rawValue {
                let metadata = MessageMetadata(level: "Warning", file: file, function: function, line: line)
                SwiftLogger.service.logCollection(collection, prefix: prefix.log(), withMetadata: metadata)
            }
    }
    
    /**
        Log a collection at *info* level. Use this sparingly for general information to avoid clogging up your logs.
    
        - parameter collection :A `CollectionType` of `Loggable` objects
    */
    public class func info<T: CollectionType where T.Generator.Element: Loggable>(
        collection: T,
        prefix: Loggable = "",
        file: String = #file,
        function: String = #function,
        line: UInt = #line) {
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.Info.rawValue {
                let metadata = MessageMetadata(level: "Info", file: file, function: function, line: line)
                SwiftLogger.service.logCollection(collection, prefix: prefix.log(), withMetadata: metadata)
            }
    }
    
    /**
        Log a collection at *debug* level. Use this to log anything that might be useful for debugging.
     
        - parameter collection :A `CollectionType` of `Loggable` objects
     */
    public class func debug<T: CollectionType where T.Generator.Element: Loggable>(
        collection: T,
        prefix: Loggable = "",
        file: String = #file,
        function: String = #function,
        line: UInt = #line) {
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.Debug.rawValue {
                let metadata = MessageMetadata(level: "Debug", file: file, function: function, line: line)
                SwiftLogger.service.logCollection(collection, prefix: prefix.log(), withMetadata: metadata)
            }
    }

    /**
        Log a collection at *verbose* level. Use this to provide fine grained message about the code path executed by your program.
     
        - parameter collection :A `CollectionType` of `Loggable` objects
     */
    public class func verbose<T: CollectionType where T.Generator.Element: Loggable>(
        collection: T,
        prefix: Loggable = "",
        file: String = #file,
        function: String = #function,
        line: UInt = #line) {
            if SwiftLogger.service.logLevel.rawValue >= SwiftLogger.LogLevel.Verbose.rawValue {
                let metadata = MessageMetadata(level: "Verbose", file: file, function: function, line: line)
                SwiftLogger.service.logCollection(collection, prefix: prefix.log(), withMetadata: metadata)
            }
    }
}