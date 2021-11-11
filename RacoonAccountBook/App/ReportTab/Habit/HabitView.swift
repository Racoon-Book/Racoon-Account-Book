// HabitView.swift

import SwiftUI

struct HabitView: View {
    var body: some View {
        CardSeperatorView(title: "支出统计")
    }
}

struct ExReport:View {
    var body: some View {
        VStack {
            Text("总支出")
            Text("¥1866")
        }
    }
}
