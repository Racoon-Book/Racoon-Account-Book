// HabitView.swift

import SwiftUI

struct StoryReportView: View {
    @Environment(\.managedObjectContext) var context

    var body: some View {
        // TODO: 这里要用CoreData获取对应的数据
        CardSeperatorView(title: "习惯统计", contentView: AnyView(HabitReportCardContent()))
        CardSeperatorView(title: "财记统计", contentView: AnyView(StoryReportCardContent()))
    }
}
