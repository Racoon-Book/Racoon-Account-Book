// FocusChartView.swift

import CoreData
import SwiftUI

struct FocusChartView: View {
    @Environment(\.managedObjectContext) var context

    @State var sumList: [Double] = []
    @State var focusNameList: [String] = []

    var body: some View {
        VStack {
            if sumList.reduce(0.0) { $0 + $1 } == 0 {
                // 这里要统计的是所有有Focus的支出的钱数 不为0就可以绘图
                Text("使用「关注」来管理财记 重点分明")
                Text("添加一笔含有「关注」的花销吧！")
            } else {
                PieChartView(
                    values: sumList,
                    names: focusNameList,
                    formatter: { value in String(format: "%.1f", value) },
                    backgroundColor: defaultColorSet.tabBackground
                )
            }
        }
        .onAppear {
            var tempFocusNameList: [String] = []
            var tempExpenseSumList: [Double] = []

            let focusExpenseSumDict = Focus.FocusExpenseSumDictionary(context: context)
            for (focusName, expenseSum) in focusExpenseSumDict.sorted(by: {
                $0.value > $1.value // 这里排序确保最高金额的颜色总是默认的第一个颜色
            }
            ) {
                tempFocusNameList.append(focusName)
                tempExpenseSumList.append(Double(expenseSum))
            }
            sumList = tempExpenseSumList
            focusNameList = tempFocusNameList
        }
    }
}
