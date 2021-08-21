// SheetConfigModel.swift

import Foundation
import SwiftDate
import SwiftUI

class SheetConfigModel: ObservableObject {
    // MARK: - Create Model

    @Published var shared = SheetConfigModel.newSheetConfig()

    private static func newSheetConfig() -> SheetConfig {
        return SheetConfig()
    }
}
