<p align = "center">
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)
[![Pod Version](https://cocoapod-badges.herokuapp.com/v/SwiftLogger/badge.png)](https://cocoapods.org/pods/SwiftLogger)
[![Swift Version](https://img.shields.io/badge/Language-Swift%202.2, 2.3 & 3.0-orange.svg)](https://developer.apple.com/swift)
[![Twitter](https://img.shields.io/badge/Twitter-@AyushN21-blue.svg)](https://twitter.com/ayushn21)
<p>

#### Build Status

| Branch  | Build Status |
| ------------- | ------------- |
| Develop  | [![Build Status](https://travis-ci.org/ayushn21/SwiftLogger.svg?branch=develop)](https://travis-ci.org/ayushn21/SwiftLogger)|
| Master  | [![Build Status](https://travis-ci.org/ayushn21/SwiftLogger.svg?branch=master)](https://travis-ci.org/ayushn21/SwiftLogger)|

## Description

SwiftLogger is designed to be a simple, easy to use, no frills logging library. It allows you to log messages at 6 different levels and formats log messages so you know exactly where and when they have been logged from. This library has prioritised ease of use over extensibility.

## Usage

SwiftLogger has 6 log levels that can be set or changed at any time.

The levels are:

1. **Off**: Turn all logging off
2. **Error**: Include error messages
3. **Warning**: Include warnings
4. **Info**: Log info messages only
5. **Debug**: Include debug messages as well
6. **Verbose**: Include literally every log message

Only logs less than or equal to the set log level will be printed to the console.

#### Setting the log level

Make sure you have the below line at the top of every file in which you would like to use this library:

    import SwiftLogger

The log level can be set using this method:
        
    SwiftLogger.logLevel = .Verbose

The log level defaults to `.Debug` if it has not been set. The `SwiftLogger.LogLevel` enum contains values for all 6 log level described above.
    
I recommend you set the log level in your app delegate method `application:didFinishLaunchingWithOptions`. You could also vary the log level via a debug settings screen if you wish.

#### Printing logs to the console

Logs can be printed at the different log levels using these 5 methods

    Log.error("Something has gone horribly wrong.")
    Log.warning("Something might go wrong.")
    Log.info("This is some useful information.")
    Log.debug("This is a debug message.")
    Log.verbose("This is some very specific information")
    
#### Log output

Log messages printed to the console will look like this:

    28-09-2015 19:40:53.535 [Info]  ViewController.swift:16 viewDidLoad(): Info message
    
#### Logging Collections

SwiftLogger has built in functionality to log collections and will not use up resources looping over a collection if it does not need to be logged for the current log level.

To log objects in a collection, all the contained objects must conform to the `Loggable` protocol. It only contains one method of the following signature: `func log() -> String`. All `NSObjects` conform to this protocol and return it's `description` property by default. Most swift primitives conform to `Loggable` by default as well!

Dictionaries can be logged where the Key and Value are both `Loggable`s.

The below code demonstrates how you can log collections to the console:
	
	    func collectionLoggingTest() {
	        let anArray = ["one","two","three","four"]
        	Log.debug(anArray)
	    }
	
You can optionally specify a prefix while logging a collection like:

		func collectionLoggingTest() {
        	let anArray = ["one","two","three","four"]
     	   	Log.debug(anArray, prefix: "anArray")
    	}
	
#### Collection Log Output

Collection log messages look like this:

	23-01-2016 23:35:15.528	[Debug]	ViewController.swift:27	collectionLoggingTest(): 
		one
		two
		three
		four

Or with a prefix:

	08-08-2016 23:05:37.420	[Debug]	ViewController.swift:27	collectionLoggingTest(): anArray
		one
		two
		three
		four	

## Requirements

SwiftLogger requires at least iOS 8 and ARC.

## Installation

SwiftLogger is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following lines to your Podfile:

    use_frameworks!
    
    # Swift 2.2
    pod "SwiftLogger", '0.4.1'
    
    # Swift 2.3
    pod "SwiftLogger", '0.5.0'
    
    # Swift 3.0
    pod "SwiftLogger", '~> 1.0.0'

## Documentation

[Docs are available on CocoaDocs](http://cocoadocs.org/docsets/SwiftLogger/)

## Release Notes

####1.0.0
Migrated code to Swift 3.0.

####0.5.0
Migrated code to Swift 2.3. There will be no more features of patches on Swift 2.3 after this release.

####0.4.1
Fixing a documentation error

####0.4.0
Added `Dictionary` support.

Increased unit test coverage.

Added option for prefix on collection logging.

####0.3.2
Fixed deprecation warnings in Swift 2.2. Added more unit tests.

####0.3.1
Fixing a documentation error.

####0.3.0
Added a new feature to log `CollectionType`s. [ Except for `Dictionaries` :( ]

####0.2.0
Modified order of log levels.

####0.1.0
Initial Release

## To-Do

I am looking to build a feature to log messages to a file in addition to the console.

## Author

Ayush Newatia, [ayush.newatia@icloud.com](mailto:ayush.newatia@icloud.com)

## License

SwiftLogger is available under the MIT license. See the LICENSE.md file for more info.
