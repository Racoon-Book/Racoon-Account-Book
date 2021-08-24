import SwiftUI
import SwiftUICharts

struct ExChartView: View {
    var expenses: [Expense]

    var body: some View {
        let data = expenses.map { Double($0.amount) }
        LineChartView(data: data, title: "本月支出", form: ChartForm.large, rateValue: nil, dropShadow: false)
    }
}
