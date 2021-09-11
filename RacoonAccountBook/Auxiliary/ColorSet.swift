// ColorSet.swift

import Foundation
import SwiftUI

struct ColorSet {
    private var colorSchema: ColorSchema

    init(colorSchema: ColorSchema) {
        self.colorSchema = colorSchema
    }

    var StoryBackground: Color {
        switch colorSchema {
        case .defaultSchema:
            return Color(hex: 0xFAF6F0)
        }
    }
}

enum ColorSchema {
    case defaultSchema
}

let defaultColorSet = ColorSet(colorSchema: .defaultSchema)
