import Foundation
import SwiftDate

// Literal        Type     Value
//
// #file          String   The name of the file in which it appears.
// #line          Int      The line number on which it appears.
// #column        Int      The column number in which it begins.
// #function      String   The name of the declaration in which it appears.
// #dsohandle     UnsafeMutablePointer   The dso handle.

// example:
// [\((#file as NSString).lastPathComponent) \(#function) line\(#line)]

// Add the following to Xcode code snippets and set its completion to 'print':
// printLog("[\((#filePath as NSString).lastPathComponent) \(#function) line\(#line)] <#*2>")

public func printLog(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    let date = DateInRegion(region: regionChina)
    let time = date.toFormat("H:mm:ss", locale: Locales.chineseChina)
    var output = items.map { "\($0)" }.joined(separator: separator)
    output = "[\(time)] " + output
    Swift.print(output, terminator: terminator)
}

public func printError(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    let date = DateInRegion(region: regionChina)
    let time = date.toFormat("H:mm:ss", locale: Locales.chineseChina)
    var output = items.map { "\($0)" }.joined(separator: separator)
    output = "[ERROR] [\(time)] " + output
    Swift.print(output, terminator: terminator)
}

public func printFatalError(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    let date = DateInRegion(region: regionChina)
    let time = date.toFormat("H:mm:ss", locale: Locales.chineseChina)
    var output = items.map { "\($0)" }.joined(separator: separator)
    output = "[FATAL ERROR] [\(time)] " + output
    Swift.print(output, terminator: terminator)
}
