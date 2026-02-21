
import SwiftUI

struct ScreenNavigatorView: View {
    @ObservedObject var navigator: ScreenNavigatorViewController
    @ObservedObject var localize: LocalizationManager

    init(navigator: ScreenNavigatorViewController, localize: LocalizationManager) {
        self.localize = localize
        self.navigator = navigator
    }

    var body: some View {
        switch navigator.current {
        case .language:
            SelectingLanguageScreen(localize: localize)
        case .onboard:
            OnboardScreen()
        }
    }
}
