// Array+Expense.swift

import CoreData
import Foundation

// include Array and FetchedResults
extension RandomAccessCollection where Element: Expense {
    func sum() -> Float {
        reduce(0.0) { $0 + $1.amount }
    }

    func max_expense() -> Expense? {
        max { $0.amount < $1.amount }
    }

    func max_amount() -> Float? {
        max_expense()?.amount
    }

    func story_only() -> [Expense] {
        filter { $0.story != nil }
    }

    func days() -> [Date] {
        // 将 expense 的时间设为当天的起始时间
        let raw_days = map { $0.spentAt.dateAt(.startOfDay) }
        let days = raw_days.enumerated().filter { index, day in
            index == raw_days.firstIndex(of: day)
        }

        return days.map(\.element)
    }
}
