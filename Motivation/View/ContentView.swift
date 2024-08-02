import SwiftUI

struct ContentView: View {
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool = false

    var body: some View {
        if isOnboardingCompleted {
            MainView()
        } else {
            OnboardingView()
        }
    }
}

#Preview {
    ContentView()
}
