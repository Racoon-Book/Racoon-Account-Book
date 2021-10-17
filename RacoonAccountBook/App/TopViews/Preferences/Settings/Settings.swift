// Settings.swift

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationView {
            VStack {
                FocusModifyView()
            }
        }
        .navigationTitle("设置")
        .navigationBarTitleDisplayMode(.inline)
    }
}
