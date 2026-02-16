import Lottie
import SwiftUI

struct SelectingLanguageView: View {
    @State private var isLoading = false

    @State private var is_en: Bool = true
    @State private var is_kh: Bool = false

    @State private var is_active: Bool = false

    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ZStack {
                    Color(UIColor(resource: .white))
                        .opacity(1)
                        .ignoresSafeArea(.all)

                    VStack(alignment: .center) {
                        HeaderContentView {
                            // back here
                        }
                        Spacer()
                        ContentView(size: proxy.size.width * 0.7)
                        Spacer()
                        FooterContentView { lang in
                            switch lang {
                            case LangEnamStatus.EN: is_en = true; is_kh = false; isLoading = true
                            case LangEnamStatus.KH: is_kh = true; is_en = false; isLoading = true
                            }
                        }
                    }
                }

                // loading
                if isLoading {
                    withAnimation(.linear(duration: 2.0)) {
                        LoadingAnimationView()
                    }
                }

            }.navigationDestination(isPresented: $is_active, destination: { GettingStartedView() })
        }
    }

    @ViewBuilder
    private func HeaderContentView(callback: @escaping () -> Void) -> some View {
        HStack {
            ButtonBack(callback: callback)
            Spacer()
        }
        .padding([.top, .leading, .trailing], 24)
    }

    @ViewBuilder
    private func ButtonBack(callback: @escaping () -> Void) -> some View {
        Button(action: callback) {
            Image(systemName: "arrow.left")
                .resizable()
                .padding(10)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)

        }.buttonStyle(AnimatedButtonStyle())
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
    private func FooterContentView(callback: @escaping (LangEnamStatus) -> Void) -> some View {
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

            ButtonKhmer(isSelected: is_kh, callback: { callback(LangEnamStatus.KH) })
            ButtonEnglish(isSelected: is_en, callback: { callback(LangEnamStatus.EN) })
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 45)
    }

    @ViewBuilder
    private func ButtonKhmer(isSelected: Bool, callback: @escaping () -> Void) -> some View {
        Button(action: callback) {
            Text("ភាសាខ្មែរ")
                .font(.system(size: 16, weight: .medium))
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .foregroundColor(Color(UIColor(resource: isSelected ? .white : .black)))
                .background(Color(UIColor(resource: isSelected ? .primary : .white)))
                .clipShape(RoundedRectangle(cornerRadius: 16))

        }.buttonStyle(AnimatedButtonStyle())
    }

    @ViewBuilder
    private func ButtonEnglish(isSelected: Bool, callback: @escaping () -> Void) -> some View {
        Button(action: callback) {
            Text("English")
                .font(.system(size: 16, weight: .medium))
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .foregroundColor(Color(UIColor(resource: isSelected ? .white : .black)))
                .background(Color(UIColor(resource: isSelected ? .primary : .white)))
                .clipShape(RoundedRectangle(cornerRadius: 16))

        }.buttonStyle(AnimatedButtonStyle())
    }
}

#Preview {
    SelectingLanguageView()
}
