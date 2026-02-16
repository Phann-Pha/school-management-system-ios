import Lottie
import SwiftUI

struct GettingStartedView: View {
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size.width * 0.7
            ZStack {
                Color(UIColor(resource: .white))
                    .opacity(1)
                    .ignoresSafeArea(.all)

                VStack(alignment: .center) {
                    HeaderContentView {
                        // skip here
                    }
                    Spacer()
                    ContentView(size: size)
                    Spacer()
                    FooterContentView {
                        // your code here
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }

    @ViewBuilder
    private func HeaderContentView(callback: @escaping () -> Void) -> some View {
        HStack {
            Spacer()
            ButtonSkip(text: "Skip", callback: callback)
        }
        .padding([.top, .leading, .trailing], 24)
    }

    @ViewBuilder
    private func ButtonSkip(text: String, callback: @escaping () -> Void) -> some View {
        Button(action: callback) {
            Text(text)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color(UIColor(resource: .black)))
                .clipShape(RoundedRectangle(cornerRadius: 16))

        }.buttonStyle(AnimatedButtonStyle())
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
                Text("Your smart solution for fast, accurate attendence tracking. Let's a quick tour!")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(UIColor(resource: .black)))
                    .lineSpacing(8)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 32)

            GetStartedButton(text: "Get Started", callback: callback)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 45)
    }

    @ViewBuilder
    private func GetStartedButton(text: String, callback: @escaping () -> Void) -> some View {
        Button(action: callback) {
            Text(text)
                .font(.system(size: 16, weight: .medium))
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .foregroundColor(Color(UIColor(resource: .white)))
                .background(Color(UIColor(resource: .primary)))
                .clipShape(RoundedRectangle(cornerRadius: 16))

        }.buttonStyle(AnimatedButtonStyle())
    }
}

#Preview {
    GettingStartedView()
}
