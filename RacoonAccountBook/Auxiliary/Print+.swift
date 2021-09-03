import Foundation
import SwiftDate

public func printLog(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    let date = DateInRegion(region: regionChina)
    let time = date.toFormat("H:mm:ss", locale: Locales.chineseChina)
    var output = items.map { "\($0)" }.joined(separator: separator)
    output = "[" + time + "] " + output
    Swift.print(output, terminator: terminator)
}

// Literal        Type     Value
//
// #file          String   The name of the file in which it appears.
// #line          Int      The line number on which it appears.
// #column        Int      The column number in which it begins.
// #function      String   The name of the declaration in which it appears.
// #dsohandle     UnsafeMutablePointer   The dso handle.

public func printError(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    var output = items.map { "\($0)" }.joined(separator: separator)
    output = "[[ERROR] \(#file).line\(#line) in \(#function)] " + output
    Swift.print(output, terminator: terminator)
}

public func printFatalError(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    var output = items.map { "\($0)" }.joined(separator: separator)
    output = "[[FATAL ERROR] \(#file).line\(#line) in \(#function)] " + output
    Swift.print(output, terminator: terminator)
}
