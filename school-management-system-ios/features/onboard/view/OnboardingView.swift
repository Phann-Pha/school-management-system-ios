
import SwiftUI

struct OnboardingView: View {
    @StateObject var viewmodel: OnboardingViewModel

    var body: some View {
        let data = viewmodel.pages
        VStack {
            ForEach(data) { data in
                Text(data.title)
            }
        }
    }
}
