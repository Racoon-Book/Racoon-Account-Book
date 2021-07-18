import SwiftUI

struct IncomeExpenditureView: View {
    var body: some View {
        ZStack {
            // 背景
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("eye"))

            // 内容
            GeometryReader { geo in
                VStack(alignment: .leading) {
                    Text("收支")
                        .font(.system(.title2))
                        .padding([.bottom], 3)
                        .foregroundColor(Color("AntiqueWhite"))

                    HStack {
                        // TODO: 这里要用geometryreader
                        WeeklyView(isWeek: true, expenditure: 130.5, income: 0)
                            .frame(width: geo.size.width * 0.5, alignment: .leading)
                        MonthlyView(isMonth: true, expenditure: 650.5, income: 0)
                            .frame(width: geo.size.width * 0.5, alignment: .leading)
                    }
                }
                .padding()
            }
        }
        .frame(height: frameHeight) // FIXME: 这里目前只能固定了 GeometryReader好像会把界面撑大
    }

    let frameHeight: CGFloat = 160
}

struct WeeklyView: View {
    var isWeek: Bool = true
    var expenditure: Float
    var income: Float

    var body: some View {
        VStack(alignment: .leading) {
            Text(isWeek ? "本周支出" : "7日支出")
                .font(.system(.headline))

            Text(String(format: "%.1f", expenditure))
                .font(.system(size: 45))

            Text(isWeek ? "本周收入\(String(format: "%.1f", income))元" : "7日收入\(String(format: "%.1f", income))元")
                .font(.system(.subheadline))
        }
        .foregroundColor(.white)
    }
}

struct MonthlyView: View {
    var isMonth: Bool = true
    var expenditure: Float
    var income: Float

    var body: some View {
        VStack(alignment: .leading) {
            Text(isMonth ? "本月支出" : "30日支出")
                .font(.system(.headline))

            Text(String(format: "%.1f", expenditure))
                .font(.system(size: 45))

            Text(isMonth ? "本月收入\(String(format: "%.1f", income))元" : "30日收入\(String(format: "%.1f", income))元")
                .font(.system(.subheadline))
        }
        .foregroundColor(.white)
    }
}

struct IncomeExpenditureView_Previews: PreviewProvider {
    static var previews: some View {
        IncomeExpenditureView()
    }
}
