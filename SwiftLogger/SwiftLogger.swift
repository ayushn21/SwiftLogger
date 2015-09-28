//
//  SwiftLogger.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 27/09/2015.
//  Copyright © 2015 Spectrum. All rights reserved.
//

public class SwiftLogger {
    
    static let service = LoggingService()
    
    static var logLevel:LogLevel {
        get {
            return SwiftLogger.service.logLevel
        }
        set {
            SwiftLogger.service.logLevel = newValue
        }
    }
    
    static var dateFormat:String {
        get {
            return SwiftLogger.service.dateFormatter.dateFormat
        }
        set {
            SwiftLogger.service.dateFormatter.dateFormat = newValue
        }
    }
}

public class Log {
        
    public class func info(
        message:String,
        file:String = __FILE__,
        function:String = __FUNCTION__,
        line:Int = __LINE__) {
        if SwiftLogger.service.logLevel.rawValue >= LogLevel.Info.rawValue {
            let message = LoggingService.Message(message, level: "Info", file: file, function: function, line: line)
            SwiftLogger.service.logMessage(message)
        }
    }
    
    public class func debug(
        message:String,
        file:NSString = __FILE__,
        function:String = __FUNCTION__,
        line:Int = __LINE__) {
        if SwiftLogger.service.logLevel.rawValue >= LogLevel.Debug.rawValue {
            let message = LoggingService.Message(message, level: "Debug", file: file, function: function, line: line)
            SwiftLogger.service.logMessage(message)
        }
    }
    
    public class func warning(
        message:String,
        file:NSString = __FILE__,
        function:String = __FUNCTION__,
        line:Int = __LINE__) {
        if SwiftLogger.service.logLevel.rawValue >= LogLevel.Warning.rawValue {
            let message = LoggingService.Message(message, level: "Warning", file: file, function: function, line: line)
            SwiftLogger.service.logMessage(message)
        }
    }
    
    public class func error(
        message:String,
        file:NSString = __FILE__,
        function:String = __FUNCTION__,
        line:Int = __LINE__) {
        if SwiftLogger.service.logLevel.rawValue >= LogLevel.Error.rawValue {
            let message = LoggingService.Message(message, level: "Error", file: file, function: function, line: line)
            SwiftLogger.service.logMessage(message)
        }
    }
    
    public class func verbose(
        message:String,
        file:NSString = __FILE__,
        function:String = __FUNCTION__,
        line:Int = __LINE__) {
        if SwiftLogger.service.logLevel.rawValue >= LogLevel.Verbose.rawValue {
            let message = LoggingService.Message(message, level: "Verbose", file: file, function: function, line: line)
            SwiftLogger.service.logMessage(message)
        }
    }
}