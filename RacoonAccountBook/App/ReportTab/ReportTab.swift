//import SwiftDate
//import SwiftUI
//
//struct ReportTab: View {
//    @Environment(\.managedObjectContext) var context
//    @State private var selectedSegment: SegmentChoice = .report
//
//    var body: some View {
//        let expenses = Expense.last_month(context: context)
//
//        NavigationView {
//            VStack {
//                Picker(selection: $selectedSegment, label: Text("页面")) {
//                    Text("关注").tag(SegmentChoice.focus)
//                    Text("简报").tag(SegmentChoice.report)
//                    Text("习惯").tag(SegmentChoice.habit)
//                }
//                .pickerStyle(SegmentedPickerStyle())
//
//                ScrollView {
//                    VStack {
//                        switch selectedSegment {
//                        case .focus:
//                            FocusExView()
//                            FocusPieChartView()
//
//                        case .report:
//                            ExView(expenses: expenses)
//                            ExChartView(expenses: expenses)
//                            DayCounterView(expenses: expenses)
//                            //FocusExView()
//
//                        case .habit:
//                            DayCounterView(expenses: expenses)
//                        }
//                    }
//                    .padding(.all, 10.0)
//                }
//                .padding(.bottom, 10.0)
//            }
//            .navigationTitle("本月的统计")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//        .edgesIgnoringSafeArea(.top)
//    }
//
//    enum SegmentChoice {
//        case focus
//        case report
//        case habit
//    }
//}
