//
//  Message.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 20/05/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import Foundation

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
    let timestamp: Date
    
    init(level: String,
         file: String,
         function: String,
         line: UInt) {
        self.level = level
        self.file = (file as NSString).lastPathComponent
        self.function = function
        self.line = line
        self.timestamp = Date()
    }
}
