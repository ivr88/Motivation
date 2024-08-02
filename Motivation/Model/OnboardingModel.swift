import Foundation

enum Category: String, CaseIterable, Identifiable {
    case love = "Love"
    case friendship = "Friendship"
    
    var id: String { self.rawValue }
}

enum BackgroundColor: String, CaseIterable, Identifiable {
    case blue = "Blue"
    case red = "Red"
    
    var id: String { self.rawValue }
}

enum Gender: String, CaseIterable, Identifiable {
    case male = "Male"
    case female = "Female"
    
    var id: String { self.rawValue }
}

struct UserPreferences {
    var category: Category?
    var backgroundColor: BackgroundColor?
    var gender: Gender?
}
