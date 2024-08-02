import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var currentStep = 0
    @Published var userPreferences = UserPreferences()
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool = false
    @AppStorage("selectedCategory") var selectedCategory: Category?
    @AppStorage("selectedColor") var selectedColor: BackgroundColor?
    @AppStorage("selectedGender") var selectedGender: Gender?

    var isNextButtonEnabled: Bool {
        switch currentStep {
        case 0:
            return userPreferences.category != nil
        case 1:
            return userPreferences.backgroundColor != nil
        case 2:
            return userPreferences.gender != nil
        default:
            return false
        }
    }

    func nextStep() {
        if currentStep < 2 {
            currentStep += 1
        } else {
            completeOnboarding()
        }
    }

    func previousStep() {
        if currentStep > 0 {
            currentStep -= 1
        }
    }

    private func completeOnboarding() {
        selectedCategory = userPreferences.category
        selectedColor = userPreferences.backgroundColor
        selectedGender = userPreferences.gender
        isOnboardingCompleted = true
    }
}
