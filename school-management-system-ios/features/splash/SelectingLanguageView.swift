import Lottie
import SwiftUI

struct SelectingLanguageView: View {
    @State private var is_back: Bool = false

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color(UIColor(resource: .white))
                    .opacity(1)
                    .ignoresSafeArea(.all)

                VStack(alignment: .center) {
                    HeaderContentView()
                    Spacer()
                    ContentView(size: proxy.size.width * 0.7)
                    Spacer()
                    FooterContentView()
                }
            }
        }
    }

    @ViewBuilder
    private func HeaderContentView() -> some View {
        HStack {
            Image(systemName: "arrow.left")
                .resizable()
                .padding(10)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .onTapGesture(perform: {
                    is_back.toggle()
                })

            Spacer()
        }
        .padding([.top, .leading, .trailing], 24)
    }

    @ViewBuilder
    private func ContentView(size: CGFloat) -> some View {
        VStack(alignment: .center) {
            LottieView(animation: .named("study_anim.json"))
                .playing(loopMode: .loop)
        }
        .aspectRatio(contentMode: .fit)
        .frame(width: size, height: size)
    }

    @ViewBuilder
    private func FooterContentView() -> some View {
        VStack(alignment: .center) {
            HStack {
                Text("Please select your language.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(UIColor(resource: .black)))
                    .lineSpacing(8)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 32)

            GetStartedButton(text: "ភាសារខ្មែរ", isSelected: true)
            GetStartedButton(text: "English", isSelected: false)
        }
        .padding(.bottom, 45)
    }

    @ViewBuilder
    private func GetStartedButton(text: String, isSelected: Bool) -> some View {
        Button(action: { }, label: {
            Text(text)
                .font(.system(size: 16, weight: .medium))
                .frame(maxWidth: .infinity, maxHeight: 60)
                .foregroundColor(Color(UIColor(resource: isSelected ? .white : .black)))
                .background(Color(UIColor(resource: isSelected ? .primary : .white)))
                .cornerRadius(12)
                .padding(.horizontal, 24)
        })
    }
}

#Preview {
    SelectingLanguageView()
}
