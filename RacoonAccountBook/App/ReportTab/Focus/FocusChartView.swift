// FocusChartView.swift

import CoreData
import SwiftUI

struct FocusChartView: View {
    @Environment(\.managedObjectContext) var context

    @State var sumList: [Double] = []
    @State var focusNameList: [String] = []

    var body: some View {
        VStack {
            PieChartView(
                values: sumList,
                names: focusNameList,
                formatter: { value in String(format: "%.1f", value) },
                backgroundColor: defaultColorSet.tabBackground
            )
        }
        .onAppear {
            var tempFocusNameList: [String] = []
            var tempExpenseSumList: [Double] = []

            let focusExpenseSumDict = Focus.FocusExpenseSumDictionary(context: context)
            for (focusName, expenseSum) in focusExpenseSumDict {
                tempFocusNameList.append(focusName)
                tempExpenseSumList.append(Double(expenseSum))
            }
            sumList = tempExpenseSumList
            focusNameList = tempFocusNameList

            print(sumList)
            print(focusNameList)
        }
    }
}
