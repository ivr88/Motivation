import SwiftUI

struct SettingsView: View {
    @AppStorage("selectedCategory") private var selectedCategory: Category = .love
    @AppStorage("selectedColor") private var selectedColor: BackgroundColor = .blue
    @AppStorage("selectedGender") private var selectedGender: Gender = .male

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Category", selection: $selectedCategory) {
                        Text("Love").tag(Category.love)
                        Text("Friendship").tag(Category.friendship)
                    }

                    Picker("Background color", selection: $selectedColor) {
                        Text("Blue").tag(BackgroundColor.blue)
                        Text("Red").tag(BackgroundColor.red)
                    }

                    Picker("Gender", selection: $selectedGender) {
                        Text("Male").tag(Gender.male)
                        Text("Female").tag(Gender.female)
                    }
                    
                    Button(action: {
                        if let url = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("Change language")
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Close")
                    .foregroundColor(.blue)
            })
        }
    }
}

#Preview {
    SettingsView()
}
