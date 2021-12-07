// Settings.swift

import SwiftUI

struct SideMenu_Settings: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                FocusModifyView()
            }
        }
        .navigationTitle("设置")
        .navigationBarTitleDisplayMode(.inline)
    }
}
