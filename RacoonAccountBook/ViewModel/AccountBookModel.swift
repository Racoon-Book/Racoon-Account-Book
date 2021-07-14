// ModelView -- Access Model & Deal with Intents

import Foundation

class MySpendingBook: ObservableObject {
    // MARK: - Create Model

    /// model: the only real var that ModelView owns
    /// @Published: Once model changes, View receives and redraw.
    @Published private var model = MySpendingBook.createMySpendingBook() // init the model

    /// Initialize Model Function (not able to directly initialize the model after equal)
    private static func createMySpendingBook() -> AccountBook {
        return AccountBook()
    }

    // MARK: - Access to Data of Model

    /// get private property from Model
    var myItems: [AccountBook.SpendingItem] {
        model.bookItems // 相当于 get { return model.bookItems }
        // 这里定义变量的目的是能拿到数据中的 private var，可以看作是一个中间桥梁/并没有新建变量
    }


    var myBookItemNumber: Int {
        model.bookItemsNumber
    }

    // MARK: - Deal with Intents from View

    func createItem(originalText: String, category: String, amount: Float) {
        model.createItem(originalText: originalText, category: category, amount: amount)
    }
}
