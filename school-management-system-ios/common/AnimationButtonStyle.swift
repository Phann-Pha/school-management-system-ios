import SwiftUI

struct AnimatedButtonStyle: ButtonStyle {
    var cornerRadius: CGFloat = 16.0
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.linear(duration: 0.1), value: configuration.isPressed)
    }
}
