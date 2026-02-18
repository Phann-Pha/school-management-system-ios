import Lottie
import SwiftUI

struct SelectingLanguageView: View {
    
    @ObservedObject var localize: LocalizationManager
    @State private var language: LangEnamStatus = LangEnamStatus.EN
    @State private var isSelected: Bool = false

    init(localize: LocalizationManager) {
        self.localize = localize
        self.language = switch localize.current {
        case LangEnamStatus.EN.value: .EN
        case LangEnamStatus.KH.value: .KH
        default: .EN
        }
    }

    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ZStack {
                    Color(UIColor(resource: .white))
                        .opacity(1)
                        .ignoresSafeArea()

                    VStack(alignment: .center) {
                        HeaderContentView {}
                        Spacer()
                        ContentView(size: proxy.size.width * 0.7)
                        Spacer()
                        FooterContentView(language: language) { value in
                            self.language = value
                            localize.onSetChangeLangue(value.value)
                            self.isSelected = true
                        }
                    }
                }
            }.navigationDestination(isPresented: $isSelected, destination: { GettingStartedView() })
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
    private func FooterContentView(language: LangEnamStatus, callback: @escaping (LangEnamStatus) -> Void) -> some View {
        @State var en: Bool = if language == .EN { true } else { false }
        @State var kh: Bool = if language == .KH { true } else { false }

        VStack(alignment: .center) {
            HStack {
                Text(LocalizedStringKey("LanguagePleaseSelectYour"))
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(UIColor(resource: .black)))
                    .lineSpacing(8)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 32)

            ButtonKhmer(isSelected: kh, callback: { callback(LangEnamStatus.KH) })
            ButtonEnglish(isSelected: en, callback: { callback(LangEnamStatus.EN) })
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 45)
    }

    @ViewBuilder
    private func ButtonKhmer(isSelected: Bool, callback: @escaping () -> Void) -> some View {
        Button(action: callback) {
            Text(LocalizedStringKey("LanguageKhmer"))
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
            Text(LocalizedStringKey("LanguageEnglish"))
                .font(.system(size: 16, weight: .medium))
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .foregroundColor(Color(UIColor(resource: isSelected ? .white : .black)))
                .background(Color(UIColor(resource: isSelected ? .primary : .white)))
                .clipShape(RoundedRectangle(cornerRadius: 16))

        }.buttonStyle(AnimatedButtonStyle())
    }
}
