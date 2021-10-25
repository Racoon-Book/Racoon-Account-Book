// Settings.swift

import SwiftUI

struct SideMenu_Settings: View {
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
