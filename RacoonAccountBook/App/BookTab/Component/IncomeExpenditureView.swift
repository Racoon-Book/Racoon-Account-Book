import SwiftUI

struct IncomeExpenditureView: View {
    var usingRelativeDays: Bool = false // 是否以近7/30日显示 // TODO: 还没做

    var sevenEx: Float = 0
    var sevenIn: Float = 0

    var thirtyEx: Float = 0
    var thirtyIn: Float = 0

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
                        PeriodExInView(period: .seven, usingRelativeDays: usingRelativeDays,
                                       expenditure: sevenEx, income: sevenIn)
                            .frame(width: geo.size.width * 0.5, alignment: .leading)
                        PeriodExInView(period: .thirty, usingRelativeDays: usingRelativeDays,
                                       expenditure: thirtyEx, income: thirtyIn)
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

struct PeriodExInView: View {
    var period: DisplayPeriod

    var usingRelativeDays: Bool = false

    var expenditure: Float
    var income: Float

    var body: some View {
        let exName = (usingRelativeDays ?
            period == .seven ? "7日" : "30日" :
            period == .seven ? "本周" : "本月")
            + "支出"

        let inName = (usingRelativeDays ?
            period == .seven ? "7日" : "30日" :
            period == .seven ? "本周" : "本月")
            + "收入"

        VStack(alignment: .leading) {
            Text(exName)
                .font(.system(.headline))

            Text(String(format: "%.1f", expenditure))
                .font(.system(size: 45))

            Text(inName + "\(String(format: "%.1f", income))元")
                .font(.system(.subheadline))
        }
        .foregroundColor(.white)
    }
}

enum DisplayPeriod {
    case seven
    case thirty
}
