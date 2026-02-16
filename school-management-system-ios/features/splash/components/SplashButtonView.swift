
import SwiftUI

struct SplashButtonView: View {
    var text: String
    var body: some View {
        Button(action: {}, label: {
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
