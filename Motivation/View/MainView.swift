import SwiftUI

struct MainView: View {
    @AppStorage("selectedCategory") private var selectedCategory: Category = .love
    @AppStorage("selectedColor") private var selectedColor: BackgroundColor = .blue
    @AppStorage("selectedGender") private var selectedGender: Gender = .male
    @StateObject private var viewModel = MainViewModel(category: .love)
    @State private var currentIndex: Int = 0
    @State private var draggingOffset: CGFloat = .zero
    @State private var showSettings = false

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        ForEach(viewModel.texts.indices, id: \.self) { index in
                            VStack {
                                Spacer()
                                Text(viewModel.texts[index].text)
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                Spacer()
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .id(index)
                        }
                    }
                }
                .content.offset(y: draggingOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            draggingOffset = value.translation.height + CGFloat(currentIndex) * -geometry.size.height
                        }
                        .onEnded { value in
                            _ = geometry.size.height / 2
                            let newIndex = Int(round((value.translation.height + CGFloat(currentIndex) * -geometry.size.height) / -geometry.size.height))
                            currentIndex = min(max(newIndex, 0), viewModel.texts.count - 1)
                            withAnimation(.spring()) {
                                draggingOffset = CGFloat(currentIndex) * -geometry.size.height
                            }
                        }
                )
                .onAppear {
                    viewModel.updateCategory(selectedCategory)
                }
                .onChange(of: selectedCategory) { newValue in
                    viewModel.updateCategory(newValue)
                }
            }
            .background(selectedColor == .blue ? Color.blue : Color.red)
            .navigationBarItems(trailing: Button(action: {
                showSettings.toggle()
            }) {
                Image(systemName: "gearshape")
                    .foregroundColor(.black)
            })
            .fullScreenCover(isPresented: $showSettings) {
                SettingsView()
            }
        }
    }
}

#Preview {
    MainView()
}
