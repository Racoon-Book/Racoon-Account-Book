import SwiftDate
import SwiftUI

struct ReportTab: View {
    @EnvironmentObject var RacoonAccountBook: AccountBookModel
    @State private var selectedSegment: SegmentChoice = .report

    var body: some View {
        let monthBook = RacoonAccountBook.GetBookOfThisMonth()

        NavigationView {
            VStack {
                Picker(selection: $selectedSegment, label: Text("页面")) {
                    Text("关注").tag(SegmentChoice.focus)
                    Text("简报").tag(SegmentChoice.report)
                    Text("习惯").tag(SegmentChoice.habit)
                }
                .pickerStyle(SegmentedPickerStyle())

                ScrollView {
                    VStack {
                        switch selectedSegment {
                        case .focus:
                            FocusExView()
                            FocusPieChartView()

                        case .report:
                            ExView(monthBook: monthBook)
                            ExChartView(monthBook: monthBook)
                            DayCounterView(monthBook: monthBook)
                            FocusExView()

                        case .habit:
                            DayCounterView(monthBook: monthBook)
                        }
                    }
                    .padding(.all, 10.0)
                }
                .padding(.bottom, 10.0)
            }
            .navigationTitle("本月的统计")
            .navigationBarTitleDisplayMode(.inline)
        }
        .edgesIgnoringSafeArea(.top)
    }

    enum SegmentChoice {
        case focus
        case report
        case habit
    }
}

struct ReportTab_Previews: PreviewProvider {
    @StateObject static var PreviewAccountBook = AccountBookModel()

    static var previews: some View {
        ReportTab()
            .environmentObject(PreviewAccountBook)
    }
}
