import SwiftDate
import SwiftUI

struct ReportTab: View {
    @Environment(\.managedObjectContext) var context

    @FetchRequest(fetchRequest: Expense.request_allExpenses)
    var expenses_all
    @FetchRequest(fetchRequest: Expense.request_expensesInThisMonth)
    var expenses_thisMonth

    @State private var selectedSegment: SegmentChoice = .report

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Picker(selection: $selectedSegment, label: Text("页面")) {
                        Text("关注").tag(SegmentChoice.focus)
                        Text("简报").tag(SegmentChoice.report)
                        Text("习惯").tag(SegmentChoice.habit)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    Spacer()
                }

                ScrollView {
                    VStack {
                        switch selectedSegment {
                        case .focus:
                            FocusChartView()

                        case .report:
                            ExInThisMonthReportView(expenseSumInThisMonth: expenses_thisMonth.sum(),
                                                    expenseCountInThisMonth: expenses_thisMonth.count,
                                                    maxExpense: expenses_thisMonth.max_expense())

                        case .habit:
                            Text("Habit")
                        }
                    }
                    .padding(.all, 10.0)
                }
                .padding(.bottom, 10.0)
            }
            .background(defaultColorSet.tabBackground.ignoresSafeArea())
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
