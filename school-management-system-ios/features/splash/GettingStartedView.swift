import Lottie
import SwiftUI

struct GettingStartedView: View {
    @State private var is_skip: Bool = false
    @State private var is_clicked_get_started: Bool = false

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size.width * 0.7
            ZStack {
                Color(UIColor(resource: .white))
                    .opacity(1)
                    .ignoresSafeArea(.all)
                
                VStack(alignment: .center) {
                    HeaderContentView()
                    Spacer()
                    ContentView(size: size)
                    Spacer()
                    FooterContentView()
                }
            }
        }
    }

    @ViewBuilder
    private func HeaderContentView() -> some View {
        HStack {
            Spacer()
            Text("Skip")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(Color(UIColor(resource: .black)))
                .lineLimit(1)
                .onTapGesture(perform: {
                    is_skip.toggle()
                })
        }
        .padding([.top, .leading, .trailing], 24)
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
    private func FooterContentView() -> some View {
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

            GetStartedButton(text: "Get Started")
        }
        .padding(.bottom, 45)
    }

    @ViewBuilder
    private func GetStartedButton(text: String) -> some View {
        Button(action: { is_clicked_get_started.toggle() }, label: {
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
