// Color+.swift

import Foundation
import SwiftUI

// Example:
// Color(hex: 0x000000)
// Color(hex: 0x000000, alpha: 0.2)

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
