import SwiftUI

struct IncomeExpenditureView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("收支")
            HStack {
                // TODO: 这里要用geometryreader
                WeeklyView(isWeek: true, expenditure: 130.5, income: 0)
                MonthlyView(isMonth: true, expenditure: 650.5, income: 0)
            }
        }
    }
}

struct WeeklyView: View {
    var isWeek: Bool = true
    var expenditure: Float
    var income: Float

    var body: some View {
        VStack(alignment: .leading) {
            Text(isWeek ? "本周支出" : "7日支出")
            Text(String(format: "%.1f", expenditure))
            Text(isWeek ? "本周收入\(String(format: "%.1f", income))元" : "7日收入\(String(format: "%.1f", income))元")
        }
    }
}

struct MonthlyView: View {
    var isMonth: Bool = true
    var expenditure: Float
    var income: Float

    var body: some View {
        VStack(alignment: .leading) {
            Text(isMonth ? "本月支出" : "30日支出")
            Text(String(format: "%.1f", expenditure))
            Text(isMonth ? "本月收入\(String(format: "%.1f", income))元" : "30日收入\(String(format: "%.1f", income))元")
        }
    }
}

// struct IncomeExpenditureView_Previews: PreviewProvider {
//    static var previews: some View {
//        IncomeExpenditureView()
//    }
// }
