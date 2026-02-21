import Lottie
import SwiftUI

struct GettingStartedScreen: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    @State private var isClicked: Bool = false
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ZStack {
                    Color(UIColor(resource: .white))
                        .ignoresSafeArea()

                    VStack(alignment: .center) {
                        HeaderContentView { presentationMode.wrappedValue.dismiss() }

                        Spacer()

                        ContentView(size: proxy.size.width * 0.7)

                        Spacer()

                        FooterContentView {
                            isClicked.toggle()
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $isClicked) {
                OnboardScreen()
            }
            .navigationBarBackButtonHidden()
        }
    }

    @ViewBuilder
    private func HeaderContentView(callback: @escaping () -> Void) -> some View {
        HStack {
            Spacer()
            ButtonSkip(callback: callback)
        }
        .padding(.horizontal, 24)
        .padding(.top, 8)
    }

    @ViewBuilder
    private func ButtonSkip(callback: @escaping () -> Void) -> some View {
        Button(action: callback) {
            Text(LocalizedStringKey("Skip"))
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color(UIColor(resource: .black)))

        }.buttonStyle(AnimatedButtonStyle(raduis: 0.0))
    }

    @ViewBuilder
    private func ContentView(size: CGFloat) -> some View {
        VStack(alignment: .center) {
            LottieView(animation: .named("exam_anim.json"))
                .playing(loopMode: .loop)
        }
        .aspectRatio(contentMode: .fit)
        .frame(width: size, height: size)
    }

    @ViewBuilder
    private func FooterContentView(callback: @escaping () -> Void) -> some View {
        VStack(alignment: .center) {
            HStack {
                Text(LocalizedStringKey("GetStartedDescription"))
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(UIColor(resource: .black)))
                    .lineSpacing(8)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 32)

            GetStartedButton(text: String(localized: .getStarted), callback: callback)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 45)
    }

    @ViewBuilder
    private func GetStartedButton(text: String, callback: @escaping () -> Void) -> some View {
        Button(action: callback) {
            Text(LocalizedStringKey("GetStarted"))
                .font(.system(size: 16, weight: .medium))
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .foregroundColor(Color(UIColor(resource: .white)))
                .background(Color(UIColor(resource: .primary)))
                .clipShape(RoundedRectangle(cornerRadius: 16))

        }.buttonStyle(AnimatedButtonStyle())
    }
}
