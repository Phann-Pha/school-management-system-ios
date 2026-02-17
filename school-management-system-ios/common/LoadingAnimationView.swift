import SwiftUI

struct LoadingAnimationView: View {
    @State private var rotate = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(UIColor(resource: .black)).opacity(0.25))
                .ignoresSafeArea()

            Circle()
                .trim(from: 0.25, to: 1)
                .stroke(Color(UIColor(resource: .primary)), style: StrokeStyle(lineWidth: 3, lineCap: .round))
                .frame(width: 40, height: 40)
                .rotationEffect(Angle(degrees: rotate ? 360 : 0))
                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false), value: rotate)
                .onAppear { rotate = true }
        }
    }
}
