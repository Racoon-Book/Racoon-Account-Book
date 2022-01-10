import Foundation
import SwiftDate

/// 一个条目的基础数据结构 用户所需要输入和生成的数据
struct ExpenseInfo {
    // MARK: - core data

    /// 用户语音输入后进行转写且用户修改错别字之后的话 or 用户敲键盘的一句话
    ///
    /// 简单记录此次花销（至少包含花销的内容和金额）
    ///
    /// 不保留原始语音
    ///
    /// 不在列表中显示 只做录入用
    var originalText: String?

    /// 消费发生的日期 单位：天
    ///
    /// 记昨天的账，日期为昨天
    var spentAtDate: Date // TODO: 这里只存日期(天)，排序时相同的日期（天）用`createAt`排序

    /// 由`originalText`去掉钱数、日期自动生成
    var event: String

    /// 金额 从`originalText`里面提取
    ///
    /// 系统记录最多两位小数 但显示时四舍五入保留为一位
    ///
    /// 输入时弹出数字键盘
    var amount: Float

    /// App自动识别originalText得到的关键词
    ///
    /// 多为名词
    var generatedTags: [String] = [] // TODO: 用户可在设置中添加自定义的词以提高准确度

    /// 花销中的要素(elements) 包括但不限于 具体事件(时间(特殊纪念日)) 地点 人物 心情
    ///
    /// 用户编辑后的 `tag_auto_generated` + 用户自己添加的
    ///
    /// 用户第一时间想到的，相关的要素，随意添加，越多越好；用户自己灵活使用
    var tags: [String] = []
    // TODO: 多次出现的`tag`产生新`focus`
    // TODO: 可用来生成词云

    /// 用户所关注的花销的点 不关心这笔花销就不设置focus
    ///
    /// 多为支出的目的 for what、用户最关心的分类
    ///
    /// 可以通过精选tag得到 多次出现的tag可以称为focus
    var focus: String?

    /// 为谁产生的花销
    ///
    /// 一般开销都是自己的 如果不是为了自己的开销 用户选择更改
    var forWho: [String] = []
    // TODO: ps. 如果是丢失的欠款，好像也不是为了自己花的吧？所以加一个lost项？

    /// 财记
    var story: Story?

    /// 财记
    struct Story {
        /// 用户对这笔支出的评价
        ///
        /// 默认无评价 表示该笔支出没什么意义
        ///
        /// 五星表示非常值得纪念 一星表示非常不值得
        ///
        /// 如果想添加故事 那么这一项从nil变为有值 默认值为3 用户调整该值后添加story
        var rating: Int?

        /// 用户想的话 可以添加一个emoji
        var emoji: String?
        // TODO: 这里也可以提供一个候选框让用户选一些预置的

        /// 用户在添加花销或回顾时找感兴趣的花销添加与这笔钱相关的故事
        var text: String?

        mutating func update(rating: Int? = nil,
                             emoji: String? = nil,
                             text: String? = nil)
        {
            if rating != nil { self.rating = rating! }
            if emoji != nil { self.emoji = emoji! }
            if text != nil { self.text = text! }
        }
    }

    // MARK: - func

    /// 重置self
    mutating func clear() {
        originalText = ""

        spentAtDate = Date()
        event = ""
        amount = 0.0

        generatedTags = []
        tags = []

        focus = nil
        forWho = []
        story = nil
    }

    /// 更新self
    ///
    /// 传nil进来表示不更新 或者直接不传
    mutating func update(originalText: String? = nil,

                         spentMoneyAt: Date? = nil,
                         event: String? = nil,
                         amount_float: Float? = nil,

                         generatedTags: [String]? = nil,
                         tags: [String]? = nil,

                         focus: String? = nil,
                         forWho: [String]? = nil,
                         story: Story? = nil)
    {
        if originalText != nil { self.originalText = originalText }

        if spentMoneyAt != nil { spentAtDate = spentMoneyAt! }
        if event != nil { self.event = event! }
        if amount_float != nil { amount = amount_float! }

        if generatedTags != nil { self.generatedTags = generatedTags! }
        if tags != nil { self.tags = tags! }

        if focus != nil { self.focus = focus! }
        if forWho != nil { self.forWho = forWho! }
        if story != nil { self.story = story! }
    }

    /// 更新self
    mutating func update(expenseInfo: ExpenseInfo) {
        self = expenseInfo
    }
}

extension ExpenseInfo: CustomStringConvertible {
    var description: String {
        let originalText: String = self.originalText ?? "nil"

        let event: String = self.event
        let amount = String(format: "%.1f", self.amount)
        let date: String = spentAtDate.toFormat("yyyy/M/d", locale: Locales.chineseChina)

        let focus: String = self.focus ?? "nil"

        let rating = String(self.story?.rating ?? 0)
        let emoji: String = self.story?.emoji ?? "nil"
        let text: String = self.story?.text ?? "nil"
        let story: String = self.story == nil ? "nil" : "\(emoji) \(rating) stars - \(text)"

        return """
        ExpenseInfo: {
        "originalText": \(originalText),
        "spentAt": \(date), "event": \(event), "amount": \(amount),
        "generatedTags": \(generatedTags), "tags": \(tags),
        "focus": \(focus), "forWho": \(forWho),
        "story": \(story)}
        """
    }
}
