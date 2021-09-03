import Foundation
import SwiftDate

// Literal        Type     Value
//
// #file          String   The name of the file in which it appears.
// #line          Int      The line number on which it appears.
// #column        Int      The column number in which it begins.
// #function      String   The name of the declaration in which it appears.

// example:
// [\((#file as NSString).lastPathComponent) \(#function) line\(#line)]

/// use `Log()` to generate head of log easily in `Swift.print()`
///
/// To create a `code snippet`:
///
/// 1. Select: print(Log().string + "<\hashinfo\hash>")
///
/// 2. Go to `Xcode -> Editor -> Create Code Snippet`.
///
/// 3. Change `\hash` to `#`.
///
/// 4. Set title as `Log()` and `completion` as `print`.
///
/// Type `print` and select the code snippet.
struct Log: CustomStringConvertible {
    public var log_short: String
    public var log_medium: String
    public var log_verbose: String

    public var time_short: String
    public var time_medium: String
    public var time_verbose: String

    init(filePath: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        let fileName = (filePath as NSString).lastPathComponent

        let date = DateInRegion(region: regionChina)
        time_short = date.toFormat("H:mm:ss", locale: Locales.chineseChina)
        time_medium = date.toFormat("M/d H:mm:ss", locale: Locales.chineseChina)
        time_verbose = date.toFormat("yyyy/M/d H:mm:ss.SSS", locale: Locales.chineseChina)

        log_short = "\(fileName)(\(line))"
        log_medium = "\(fileName)(\(line)) \(funcName)"
        log_verbose = "\(filePath)(\(line),\(column)) \(funcName)"
    }

    public var description: String {
        return "[\(time_short) \(log_medium)]\n\t"
    }

    public var string: String {
        description
    }

    public var error: String {
        "[ERROR] " + description
    }

    public var fatalerror: String {
        "[FATAL ERROR] " + description
    }
}
