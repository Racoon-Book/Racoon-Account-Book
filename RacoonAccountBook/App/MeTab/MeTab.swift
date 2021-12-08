// MeTab.swift

import SwiftUI

struct MeTab: View {
    var body: some View {
        NavigationView {
            List {
                Section { NavigationLink(destination: SideMenu_Settings()) { Text("设置") }}

                Section { NavigationLink(destination: SideMenu_About()) { Text("关于") }}
            }
            .listStyle(.insetGrouped)

            .navigationTitle("我的")
            .navigationBarTitleDisplayMode(.inline)

            .background(defaultColorSet.tabBackground.ignoresSafeArea()) // FIXME: 这个颜色怎么和其他的Tab不一样？
        }
    }
}
