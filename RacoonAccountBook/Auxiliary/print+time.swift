//
//  print+time.swift
//  RacoonAccountBook
//
//  Created by 杨希杰 on 2021/7/15.
//

import Foundation
import SwiftDate

public func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    let date = DateInRegion(region: regionChina)
    let time = date.toFormat("H:mm:ss", locale: Locales.chineseChina)
    var output = items.map { "\($0)" }.joined(separator: separator)
    output = "[" + time + "] " + output
    Swift.print(output, terminator: terminator)
}
