
import Lottie
import SwiftUI

struct OnboardScreen: View {
    @Environment(\.presentationMode) private var backStack: Binding<PresentationMode>

    @State private var currentPage: Int = 0
    @State private var animation: Bool = false
    @State private var deliveryOffset: Bool = false
    @State private var trackingProgress: CGFloat = 0.0

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color(UIColor(resource: .white))
                    .ignoresSafeArea()

                VStack(alignment: .center) {
                    HeaderContentView(onBack: {
                        backStack.wrappedValue.dismiss()
                    }, onSkip: {
                    })

                    Spacer()

                    ContentView(size: proxy.size.width * 0.7)

                    Spacer()
                    FooterContentView {
                    }
                }
            }

        }.navigationBarBackButtonHidden()
    }

    @ViewBuilder
    private func ContentView(size: CGFloat) -> some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(OnboardPage.allCases, id: \.rawValue) { page in
                    CardViewTab(size: size, page: page)
                        .tag(page.rawValue)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.spring(), value: currentPage)
        }
    }

    @ViewBuilder
    private func CardViewTab(size: CGFloat, page: OnboardPage) -> some View {
        VStack(alignment: .center, spacing: 30) {
            VStack(alignment: .center) {
                LottieView(animation: .named("exam_anim.json"))
                    .playing(loopMode: .loop)
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)

            HStack {
                Text(LocalizedStringKey("GetStartedDescription"))
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(UIColor(resource: .black)))
                    .lineSpacing(8)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 32)
        }
    }

    @ViewBuilder
    private func HeaderContentView(onBack: @escaping () -> Void, onSkip: @escaping () -> Void) -> some View {
        HStack(alignment: .center) {
            ButtonBack(callback: onBack)
            Spacer()
            ButtonSkip(callback: onSkip)
        }
        .padding(.horizontal, 24)
        .padding(.top, 8)
    }

    @ViewBuilder
    private func ButtonBack(callback: @escaping () -> Void) -> some View {
        Button(action: callback) {
            Image(systemName: "arrow.left")
                .resizable()
                .padding(10)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)

        }.buttonStyle(AnimatedButtonStyle(raduis: 0.0))
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
    private func FooterContentView(callback: @escaping () -> Void) -> some View {
        VStack(alignment: .center) {
            NextButton(callback: callback)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 45)
    }

    @ViewBuilder
    private func NextButton(callback: @escaping () -> Void) -> some View {
        Button(action: callback) {
            Image(systemName: "chevron.forward")
                .resizable()
                .padding(10)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)

        }.buttonStyle(AnimatedButtonStyle())
    }
}
