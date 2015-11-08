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
        
    SwiftLogger.logLevel = SwiftLogger.LogLevel.Verbose

The log level defaults to `Debug` if it has not been set. The `SwiftLogger.LogLevel` enum contains values for all 6 log level described above.
    
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

## Requirements

SwiftLogger requires at least iOS 8 and ARC.

## Installation

SwiftLogger is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following lines to your Podfile:

    use_frameworks!
    pod "SwiftLogger"

## Documentation

[Docs are available on CocoaDocs](http://cocoadocs.org/docsets/SwiftLogger/)

## To-Do

I am still working on a feature to log messages to a file in addition to the console.

## Author

Ayush Newatia, [ayush.newatia@icloud.com](mailto:ayush.newatia@icloud.com)

## License

SwiftLogger is available under the MIT license. See the LICENSE.md file for more info.
