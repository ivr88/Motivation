import SwiftUI

struct GenderSelectionView: View {
    @Binding var selectedGender: Gender?

    var body: some View {
        VStack {
            Text("Choose Your Gender")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            ForEach(Gender.allCases) { gender in
                Button(action: {
                    selectedGender = gender
                }) {
                    Text(gender.rawValue)
                        .padding()
                        .background(selectedGender == gender ? Color.purple : Color.clear)
                        .foregroundColor(selectedGender == gender ? .white : .black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(gender == selectedGender ? Color.purple : Color.gray, lineWidth: 2)
                        )
                }
                .padding()
            }
        }
    }
}

#Preview {
    GenderSelectionView(selectedGender: .constant(.female))
}
