//
//  Locale+.swift
//  RacoonAccountBook
//
//  Created by 杨希杰 on 2021/7/23.
//

import Foundation
import NaturalLanguage
import SwiftDate

// SwiftDate
// 之后所有生成的`DataInRegion`都需要添加`region: regionChina`
let regionChina = Region(calendar: Calendars.republicOfChina,
                         zone: Zones.asiaShanghai,
                         locale: Locales.chineseChina)

// SwiftSpeech
let ChineseSpeechIdentifier: String = "zh_Hans_CN"

// NLP
let NLChinese = NLLanguage.simplifiedChinese
