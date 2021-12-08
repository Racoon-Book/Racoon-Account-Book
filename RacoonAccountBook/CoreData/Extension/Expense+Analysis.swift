// Expenses+Analysis.swift

import CoreData
import Foundation
import SwiftDate

extension Expense {
    // MARK: - Analysis

    // TODO: 这个函数是用来干嘛的？
//    static func continous_days(context: NSManagedObjectContext) -> [Date] {
//        let all_expenses = Expense.getAllExpenses(context: context)
//        var days = [Date]()
//        // 明天
//        var last_day = Date().dateAt(.startOfDay) + 1.days
//
//        for expense in all_expenses {
//            let now_day = expense.spentAt.dateAt(.startOfDay)
//            if now_day == last_day {
//                continue
//            } else if now_day + 1.days == last_day {
//                days.append(now_day)
//                last_day = now_day
//            } else {
//                break
//            }
//        }
//
//        return days
//    }
}
