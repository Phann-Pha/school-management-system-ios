
import SwiftUI

struct AppCoordinatorView: View {
    @ObservedObject var coordinator: AppCoordinator
    @ObservedObject var localize: LocalizationManager

    @State private var language: LangEnamStatus = LangEnamStatus.EN
    init(coordinator: AppCoordinator, localize: LocalizationManager) {
        self.localize = localize
        self.coordinator = coordinator
        onSwitchLanguage(value: localize.current)
    }

    private func onSwitchLanguage(value: String) {
        self.language = switch value {
        case LangEnamStatus.EN.value: .EN
        case LangEnamStatus.KH.value: .KH
        default: .EN
        }
    }

    var body: some View {
        switch coordinator.current {
        case .SELECT_LANGUAGE:
            SelectingLanguageView(localize: localize, language: $language)
        case .MAIN:
            OnboardingView(viewmodel: OnboardingViewModel(usecase: QueryOnboardingUseCase(service: OnboardingService())))
        }
    }
}
