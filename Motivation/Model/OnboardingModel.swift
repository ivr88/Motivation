import Foundation

enum Category: String, CaseIterable, Identifiable {
    case love = "Love"
    case friendship = "Friendship"
    
    var id: String { self.rawValue }
    
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

enum BackgroundColor: String, CaseIterable, Identifiable {
    case blue = "Blue"
    case red = "Red"
    
    var id: String { self.rawValue }
    
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

enum Gender: String, CaseIterable, Identifiable {
    case male = "Male"
    case female = "Female"
    
    var id: String { self.rawValue }
    
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

struct UserPreferences {
    var category: Category?
    var backgroundColor: BackgroundColor?
    var gender: Gender?
}
