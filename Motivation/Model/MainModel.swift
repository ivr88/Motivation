import Foundation

struct TextItem: Identifiable {
    var id = UUID()
    var text: String
}

let loveTexts: [TextItem] = [
    TextItem(text: NSLocalizedString("I am worthy of love and deserve to receive love in abundance", comment: "")),
    TextItem(text: NSLocalizedString("My heart is open to giving and receiving love", comment: "")),
    TextItem(text: NSLocalizedString("I am surrounded by love every day and in every way", comment: "")),
    TextItem(text: NSLocalizedString("I attract love and loving relationships into my life", comment: "")),
    TextItem(text: NSLocalizedString("Love flows to me and through me effortlessly", comment: "")),
    TextItem(text: NSLocalizedString("I radiate love and others reflect love back to me", comment: "")),
    TextItem(text: NSLocalizedString("My relationships are filled with love, happiness, and respect", comment: "")),
    TextItem(text: NSLocalizedString("I am grateful for the love that surrounds me", comment: "")),
    TextItem(text: NSLocalizedString("Love comes to me easily and effortlessly", comment: "")),
    TextItem(text: NSLocalizedString("I am a magnet for loving and fulfilling relationships", comment: ""))
]

let friendshipTexts: [TextItem] = [
    TextItem(text: NSLocalizedString("I am surrounded by supportive and loving friends", comment: "")),
    TextItem(text: NSLocalizedString("I attract positive and loyal friendships into my life", comment: "")),
    TextItem(text: NSLocalizedString("My friends and I share mutual respect and trust", comment: "")),
    TextItem(text: NSLocalizedString("I am a kind and caring friend, and I receive the same in return", comment: "")),
    TextItem(text: NSLocalizedString("My friendships are filled with joy, laughter, and understanding", comment: "")),
    TextItem(text: NSLocalizedString("I am grateful for the amazing friends in my life", comment: "")),
    TextItem(text: NSLocalizedString("I nurture and cherish my friendships", comment: "")),
    TextItem(text: NSLocalizedString("I attract friends who support and uplift me", comment: "")),
    TextItem(text: NSLocalizedString("My friends and I grow together in love and harmony", comment: "")),
    TextItem(text: NSLocalizedString("I am a magnet for genuine and lasting friendships", comment: ""))
]
