import CoreData
import SwiftDate
import SwiftUI

struct ExReportCardContent: View {
    var expenseSum: Float
    var expenseCount: Int
    var maxExpense: Expense?

    var body: some View {
        VStack(alignment: .leading) {
            if expenseSum == 0 {
                Text("还没有记账信息呢")
            } else {
                let expenseAvgInThisMonth = String(format: "%.1f", expenseSum / Float(DateInRegion(region: regionChina).day))
                ReportItem(
                    reportTitle: "总支出",
                    reportBody: "¥\(expenseSum)",
                    reportTintColor: .purple,
                    reportNote: "相当于每天花 \(expenseAvgInThisMonth) 元")
                    .padding([.bottom])

                ReportItem(
                    reportTitle: "支出笔数",
                    reportBody: "\(expenseCount)笔",
                    reportTintColor: .blue,
                    reportNote: nil)
                    .padding([.bottom])
                if let maxEx = maxExpense {
                    ReportItem(
                        reportTitle: "最高支出",
                        reportBody: "\(maxEx.event)",
                        reportTintColor: .blue,
                        reportNote: "\(DisplayDate(maxEx.spentAt)), 在\(maxEx.event)上画了\(maxEx.amount)元")
                }
            }
        }
    }
}

struct ReportItem: View {
    var reportTitle: String
    var reportBody: String
    var reportTintColor: Color = .purple
    var reportNote: String?

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(reportTitle)")
                .font(.system(.title2))
                .foregroundColor(reportTintColor)
            Text("\(reportBody)")
                .font(.system(.title, design: .rounded))
                .foregroundColor(reportTintColor)
            if let note = reportNote {
                Text("\"\(note)\"")
                    .font(.system(.body))
                    .foregroundColor(.secondary)
            }
        }
    }
}
