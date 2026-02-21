
import Lottie
import SwiftUI

struct OnboardScreen: View {
    @Environment(\.presentationMode) private var backStack: Binding<PresentationMode>

    @State private var currentPage: Int = 0
    @State private var isAnimation: Bool = false

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
                    FooterContentView(horizental: proxy.size.width * 0.12) {
                        withAnimation(.spring()) {
                            if currentPage < OnboardPage.allCases.count - 1 {
                                currentPage += 1

                                isAnimation = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                                    isAnimation = true
                                })
                            } else {
                                // handle finish
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                withAnimation {
                    isAnimation = true
                }
            })
        }
        .navigationBarBackButtonHidden()
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
    private func ContentView(size: CGFloat) -> some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(OnboardPage.allCases, id: \.rawValue) { page in
                    CardViewTab(size: size, page: page)
                        .tag(page.rawValue)
                }
            }
            .highPriorityGesture(DragGesture())
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.spring(), value: currentPage)
        }
    }

    @ViewBuilder
    private func CardViewTab(size: CGFloat, page: OnboardPage) -> some View {
        VStack(alignment: .center, spacing: 30) {
            VStack(alignment: .center) {
                LottieView(animation: .named(page.lottieName))
                    .playing(loopMode: .loop)
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
            .opacity(isAnimation ? 1 : 0)
            .offset(y: isAnimation ? 0 : 20)
            .animation(.spring(dampingFraction: 0.8).delay(0.2), value: isAnimation)

            HStack {
                Text(LocalizedStringKey(page.description))
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(UIColor(resource: .black)))
                    .lineSpacing(8)
                    .opacity(isAnimation ? 1 : 0)
                    .offset(y: isAnimation ? 0 : 20)
                    .animation(.spring(dampingFraction: 0.8).delay(0.2), value: isAnimation)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 32)
        }
    }

    @ViewBuilder
    private func FooterContentView(horizental: CGFloat, callback: @escaping () -> Void) -> some View {
        HStack(alignment: .center) {
            DotIndicatorView()
            Spacer()
            NextButton(callback: callback)
        }
        .padding(.horizontal, horizental)
        .padding(.bottom, 45)
    }

    @ViewBuilder
    private func NextButton(callback: @escaping () -> Void) -> some View {
        Button(action: callback) {
            Image(systemName: "chevron.forward")
                .foregroundColor(.white)
                .padding(10)
                .frame(width: 60, height: 60)
                .background(Color(UIColor(resource: .primary)))
                .clipShape(RoundedRectangle(cornerRadius: 18))
        }
        .buttonStyle(AnimatedButtonStyle())
        .shadow(color: Color.black.opacity(0.25), radius: 18)
    }

    @ViewBuilder
    private func DotIndicatorView() -> some View {
        HStack(spacing: 8) {
            ForEach(0 ..< OnboardPage.allCases.count, id: \.self) { index in
                RoundedRectangle(cornerRadius: 12)
                    .fill(index == currentPage ? Color(UIColor(resource: .primary)) : Color.gray.opacity(0.3))
                    .frame(width: currentPage == index ? 45 : 12, height: 12)
                    .animation(.spring(), value: currentPage)
            }
        }
    }
}

#Preview {
    OnboardScreen()
}
