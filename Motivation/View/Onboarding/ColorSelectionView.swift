import SwiftUI

struct ColorSelectionView: View {
    @Binding var selectedColor: BackgroundColor?

    var body: some View {
        VStack {
            Text("Choose Background Color")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            ForEach(BackgroundColor.allCases) { color in
                Button(action: {
                    selectedColor = color
                }) {
                    Text(color.rawValue)
                        .padding()
                        .background(selectedColor == color ? Color.purple : Color.clear)
                        .foregroundColor(selectedColor == color ? .white : .black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(color == selectedColor ? Color.purple : Color.gray, lineWidth: 2)
                        )
                }
                .padding()
            }
        }
    }
}

#Preview {
    ColorSelectionView(selectedColor: .constant(.red))
}
