// MeTab.swift

import SwiftUI

struct MeTab: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: SideMenu_Settings()) { Text("设置") }
                NavigationLink(destination: SideMenu_About()) { Text("关于") }
            }
            .background(Color.white)

            .navigationTitle("我的")
            .navigationBarTitleDisplayMode(.inline)

            .background(defaultColorSet.tabBackground.ignoresSafeArea()) // background color:真正上色
        }
    }
}
