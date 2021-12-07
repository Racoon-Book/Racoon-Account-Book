import SwiftDate
import SwiftUI

struct ReportTab: View {
    @Environment(\.managedObjectContext) var context

    @State private var selectedSegment: SegmentChoice = .report

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Picker(selection: $selectedSegment, label: Text("页面")) {
                        Text("关注").tag(SegmentChoice.focus)
                        Text("简报").tag(SegmentChoice.report)
                        Text("财记").tag(SegmentChoice.story)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Spacer()
                }

                ScrollView {
                    VStack {
                        switch selectedSegment {
                        case .focus:
                            FocusChartView()

                        case .report:
                            BriefReportView()

                        case .story:
                            StoryReportView()
                        }
                    }
                    .environment(\.managedObjectContext, context)
                    .padding(.all, 10.0)
                }
                .padding(.bottom, 10.0)
            }
            .background(defaultColorSet.tabBackground.ignoresSafeArea())
            .navigationTitle("统计")
            .navigationBarTitleDisplayMode(.inline)
        }
        .edgesIgnoringSafeArea(.top)
    }

    enum SegmentChoice {
        case focus
        case report
        case story
    }
}
