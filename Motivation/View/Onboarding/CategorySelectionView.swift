import SwiftUI

struct CategorySelectionView: View {
    @Binding var selectedCategory: Category?

    var body: some View {
        VStack {
            Text(NSLocalizedString("Choose category", comment: ""))
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            ForEach(Category.allCases) { category in
                Button(action: {
                    selectedCategory = category
                }) {
                    Text(category.localized)
                        .padding()
                        .background(selectedCategory == category ? Color.purple : Color.clear)
                        .foregroundColor(selectedCategory == category ? .white : .black)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(selectedCategory == category ? Color.purple : Color.gray, lineWidth: 2)
                        )
                }
                .padding()
            }
        }
    }
}

#Preview {
    CategorySelectionView(selectedCategory: .constant(.friendship))
}
