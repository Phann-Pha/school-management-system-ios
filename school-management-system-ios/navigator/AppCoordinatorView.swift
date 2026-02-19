
import SwiftUI

struct AppCoordinatorView: View {
    @ObservedObject var coordinator: AppCoordinator
    @ObservedObject var localize: LocalizationManager

    init(coordinator: AppCoordinator, localize: LocalizationManager) {
        self.localize = localize
        self.coordinator = coordinator
    }

    var body: some View {
        switch coordinator.current {
        case .SELECT_LANGUAGE:
            SelectingLanguageView(localize: localize)
        case .MAIN:
            OnboardingView(viewmodel: OnboardingViewModel(usecase: QueryOnboardingUseCase(service: OnboardingService())))
        }
    }
}
