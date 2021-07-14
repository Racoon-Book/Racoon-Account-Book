import Foundation
import SwiftDate

// [测试数据]

let testMetaItem_1 = AccountBook.MetaItem(
    originalText: "买水果花了二十",
    spentMoneyAt: "2020-12-12".toDate("yyyy-MM-dd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买水果",
    amount_float: 20)
let testMetaItem_2 = AccountBook.MetaItem(
    originalText: "花二十二块五买了课本",
    spentMoneyAt: "2021-07-14".toDate("yyyy-MM-dd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买课本",
    amount_float: 22.5)
let testMetaItem_3 = AccountBook.MetaItem(
    originalText: "和朋友一起出去吃饭花了一百二",
    spentMoneyAt: "2021-07-14".toDate("yyyy-MM-dd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "和朋友聚餐",
    amount_float: 120)
let testMetaItem_4 = AccountBook.MetaItem(
    originalText: "快餐三十三",
    spentMoneyAt: "2021-07-15".toDate("yyyy-MM-dd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "快餐",
    amount_float: 33)

let testMetaItems: [AccountBook.MetaItem] = [testMetaItem_1, testMetaItem_2, testMetaItem_3, testMetaItem_4]
