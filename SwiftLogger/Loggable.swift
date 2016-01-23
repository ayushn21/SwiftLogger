//
//  Loggable.swift
//  SwiftLogger
//
//  Created by Ayush Newatia on 23/01/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

/// Protocol to log objects contained in arrays, dictionaries or sets
public protocol Loggable {
    /**
     - Returns: A string representation of the object, used for logging purposes
     */
    func log() -> String
}

extension NSObject : Loggable {
    public func log() -> String {
        return self.description
    }
}