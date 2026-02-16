
import Lottie
import SwiftUI

struct SplashView: View {
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size.width * 0.7
            ZStack {
                Color(UIColor(resource: .white)).ignoresSafeArea(edges: .all)
                VStack(alignment: .center) {
                    Spacer()

                    VStack(alignment: .center) {
                        LottieView(animation: .named("exam_anim.json"))
                            .playing(loopMode: .loop)
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)

                    Spacer()
                    VStack(alignment: .center) {
                        HStack {
                            Text("Your samrt solution for fast, accurate attendence tracking. Let's a quick tour!")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color(UIColor(resource: .black)))
                                .lineSpacing(8)
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 32)

                        SplashButtonView(text: "Get Started")
                    }
                    .padding(.bottom, 45)
                }
            }
        }
    }
}
