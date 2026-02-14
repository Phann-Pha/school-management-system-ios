
import SwiftUI

struct SplashButtonView: View {
    var text: String
    var body: some View {
        Button(action: {}, label: {
            Text(text)
                .font(.system(size: 14, weight: .medium))
                .frame(maxWidth: .infinity, maxHeight: 56)
                .foregroundColor(Color(UIColor(resource: .white)))
                .background(Color(UIColor(resource: .black)))
                .cornerRadius(12)
                .padding(.horizontal, 24)
        })
    }
}
