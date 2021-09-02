import Foundation
import SwiftDate

public func printLog(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    let date = DateInRegion(region: regionChina)
    let time = date.toFormat("H:mm:ss", locale: Locales.chineseChina)
    var output = items.map { "\($0)" }.joined(separator: separator)
    output = "[" + time + "] " + output
    Swift.print(output, terminator: terminator)
}

public func printError(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    var output = items.map { "\($0)" }.joined(separator: separator)
    output = "[[ERROR]] " + output
    Swift.print(output, terminator: terminator)
}

public func printFatalError(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    var output = items.map { "\($0)" }.joined(separator: separator)
    output = "[[FATAL ERROR]] " + output
    Swift.print(output, terminator: terminator)
}
