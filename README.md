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
    
##### Log output

Log messages printed to the console will look like this:

    28-09-2015 19:40:53.535 [Info]  ViewController.swift:16 viewDidLoad(): Info message
    
#### Logging Collections

SwiftLogger has built in functionality to log collections and will not use up resources looping over a collection if it does not need to be logged for the current log level.

To log objects in a collection, all the contained objects must conform to the `Loggable` protocol. It only contains one method of the following signature: `func log() -> String`. All `NSObjects` conform to this protocol and return it's `description` property by default. Most swift primitives conform to `Loggable` by default as well!

Unfortunately logging of `Dictionaries` is not yet supported but is on the roadmap.

The below code demonstrates how you can log collections to the console:
	
	    func collectionLoggingTest() {
	        let anArray = ["one","two","three","four"]
        	Log.debug(anArray)
	    }
	
#### Collection Log Output

Collection log messages look like this:

	23-01-2016 23:35:15.528	[Info]	ViewController.swift:27	collectionLoggingTest(): 
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
    pod "SwiftLogger"

## Documentation

[Docs are available on CocoaDocs](http://cocoadocs.org/docsets/SwiftLogger/)

## Release Notes

####0.3.0
Added a new feature to log `CollectionType`s. [ Except for `Dictionaries` :( ]

####0.2.0
Modified order of log levels.

####0.1.0
Initial Release

## To-Do

I am still working on a feature to log messages to a file in addition to the console.
Dictionary support also needs to be added to `CollectionType` logging.

## Author

Ayush Newatia, [ayush.newatia@icloud.com](mailto:ayush.newatia@icloud.com)

## License

SwiftLogger is available under the MIT license. See the LICENSE.md file for more info.
