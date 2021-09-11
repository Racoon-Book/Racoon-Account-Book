// ColorSet.swift

import Foundation
import SwiftUI

// consider sub ColorSet
struct ColorSet {
    let cardBackground = Color(hex: 0xFCFCFC)
    let tabBackground = Color(hex: 0xF2F2F2)

    // MARK: - Sheet

    let previewBackground = Color(hex: 0xF8F3EE)
    let extraInfoButton = Color.blue
    let storyFieldBorder = Color(hex: 0xCFBCB2)
    let alertBackground = Color(hex: 0xEFEFF1, alpha: 0.95)

    // MARK: - BookTab

    let bookTabTitle = Color(hex: 0xA36614)
    let addButton = Color(hex: 0xF5BDA0)
    let storyRibbon = Color(hex: 0x336CEE)
    let capsule = Capsule()

    // MARK: - StoryTab

    let star = Color(hex: 0xFFDD5E)
    let emojiBackground = Color(hex: 0xF6E5C5)

    // MARK: - ReportTab

    let reportTabTitle = Color(hex: 0x4B5FCD)

    // MARK: - Struct

    struct Capsule {
        let tag = Color(hex: 0xCB844A)
        let unselectedTag = Color(hex: 0xCB844A).opacity(0.6)
        let focus = Color.blue
        let unselectedFocus = Color.blue.opacity(0.6)
        let person = Color(hex: 0x785EAF)
    }
}

let defaultColorSet = ColorSet()
