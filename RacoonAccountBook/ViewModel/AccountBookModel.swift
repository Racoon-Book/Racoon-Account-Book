// ModelView -- Access Model & Deal with Intents

import Foundation

class AccountBookModel: ObservableObject {
    // MARK: - Create Model

    @Published private var model = AccountBookModel.newAccountBook() // init the model

    // Initialize Model (not able to directly initialize the model after equal)
    private static func newAccountBook() -> AccountBook {
        return AccountBook()
    }

    // MARK: - Access to Data of Model

    // get private property from Model
    var items: [AccountBook.Item] {
        model.items // 相当于 get { return model.items }
    }

    var itemsAmount: Int {
        model.itemsAmount
    }

    // MARK: - Deal with Intents from View

    func createItem(metadata: AccountBook.MetaItem) {
        _ = model.createItem(metadata: metadata)
    }
}
