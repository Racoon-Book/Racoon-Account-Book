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
    var items: [Item] {
        model.items // 相当于 get { return model.items }
    }

    var itemsAmount: Int {
        model.itemsAmount
    }

    var book: [MyYear: YearlyInEx] {
        model.book
    }

    // MARK: - Deal with Intents from View

    func createItem(metadata: MetaItem) {
        _ = model.createItem(metadata: metadata)
    }
}
