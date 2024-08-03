import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                switch viewModel.currentStep {
                case 0:
                    CategorySelectionView(selectedCategory: $viewModel.userPreferences.category)
                case 1:
                    ColorSelectionView(selectedColor: $viewModel.userPreferences.backgroundColor)
                case 2:
                    GenderSelectionView(selectedGender: $viewModel.userPreferences.gender)
                default:
                    Text("Error")
                }

                Spacer()

                HStack {
                    Button(action: {
                        viewModel.nextStep()
                    }) {
                        Text(viewModel.currentStep < 2 ? NSLocalizedString("Next", comment: "") : NSLocalizedString("Finish", comment: ""))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(viewModel.isNextButtonEnabled ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                    .disabled(!viewModel.isNextButtonEnabled)
                }
                .padding(.horizontal)
            }
            .padding()
            .navigationBarItems(leading: viewModel.currentStep > 0 ? backButton : nil)
            .navigationBarTitleDisplayMode(.inline)
        }
        .animation(.default, value: viewModel.currentStep)
        .transition(.slide)
    }

    private var backButton: some View {
        Button(action: {
            viewModel.previousStep()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.blue)
        }
    }
}

#Preview {
    OnboardingView()
}
