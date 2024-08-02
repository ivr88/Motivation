import SwiftUI

class MainViewModel: ObservableObject {
    @Published var currentIndex = 0
    var texts: [TextItem] = []

    init(category: Category) {
        updateCategory(category)
    }

    func updateCategory(_ category: Category) {
        switch category {
        case .love:
            self.texts = loveTexts
        case .friendship:
            self.texts = friendshipTexts
        }
    }
}
