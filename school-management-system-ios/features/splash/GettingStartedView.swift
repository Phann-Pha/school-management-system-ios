import Lottie
import SwiftUI

struct GettingStartedView: View {
    @State private var btnGetStarted: Bool = false

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

                        GetStartedButton(text: "Get Started")
                    }
                    .padding(.bottom, 45)
                }
            }
        }
    }

    @ViewBuilder
    private func GetStartedButton(text: String) -> some View {
        Button(action: { btnGetStarted.toggle() }, label: {
            Text(text)
                .font(.system(size: 16, weight: .medium))
                .frame(maxWidth: .infinity, maxHeight: 60)
                .foregroundColor(Color(UIColor(resource: .white)))
                .background(Color(UIColor(resource: .primary)))
                .cornerRadius(12)
                .padding(.horizontal, 24)
        })
    }
}

#Preview {
    GettingStartedView()
}
