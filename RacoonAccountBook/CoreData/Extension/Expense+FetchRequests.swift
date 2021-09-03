// Expense+FetchRequests.swift

import CoreData
import Foundation
import SwiftDate

extension Expense {
    // MARK: - FetchRequests

    // multiple - all

    static var request_allExpenses: NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: true)]
        return request
    }

    static var request_allExpensesWithStory: NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: false)]
        request.predicate = NSPredicate(format: "story_ != nil")
        return request
    }

    // multiple - period 30

    static var request_expensesInLast30days: NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: true)]
        request.predicate = NSPredicate(
            format: "spentAt_ >= %@ and spentAt_ < %@",
            (DateInRegion(region: regionChina) - 30.days).date as NSDate,
            DateInRegion(region: regionChina).date as NSDate)
        return request
    }

    static var request_expensesInThisMonth: NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: true)]
        request.predicate = NSPredicate(
            format: "spentAt_ >= %@ and spentAt_ < %@",
            DateInRegion(region: regionChina).dateAt(.startOfMonth).date as NSDate,
            DateInRegion(region: regionChina).dateAt(.endOfMonth).date as NSDate)
        return request
    }

    static func request_expensesInMonth(_ month: DateInRegion) -> NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: true)]
        request.predicate = NSPredicate(
            format: "spentAt_ >= %@ and spentAt_ < %@",
            month.dateAt(.startOfMonth).date as NSDate,
            month.dateAt(.endOfMonth).date as NSDate)
        return request
    }

    // multiple - period 7

    static var request_expensesInLast7days: NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: true)]
        request.predicate = NSPredicate(
            format: "spentAt_ >= %@ and spentAt_ < %@",
            (DateInRegion(region: regionChina) - 7.days).date as NSDate,
            DateInRegion(region: regionChina).date as NSDate)
        return request
    }

    static var request_expensesInThisWeek: NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: true)]
        request.predicate = NSPredicate(
            format: "spentAt_ >= %@ and spentAt_ < %@",
            DateInRegion(region: regionChina).dateAt(.startOfWeek).date as NSDate,
            DateInRegion(region: regionChina).dateAt(.endOfWeek).date as NSDate)
        return request
    }

    // multiple - period 1

    static func request_expensesInDay(day: DateInRegion) -> NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "spentAt_", ascending: true)]
        request.predicate = NSPredicate(
            format: "spentAt_ >= %@ and spentAt_ < %@",
            day.dateAt(.startOfDay).date as NSDate,
            day.dateAt(.endOfDay).date as NSDate)
        return request
    }

    // single - uuid

    static func request_expenseBy(uuid: UUID) -> NSFetchRequest<Expense> {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.sortDescriptors = [NSSortDescriptor(key: "uuid_", ascending: true)]
        request.predicate = NSPredicate(
            format: "uuid_ = %@", uuid as CVarArg)
        return request
    }
}
