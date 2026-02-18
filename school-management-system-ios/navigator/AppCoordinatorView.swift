
import SwiftUI

struct AppCoordinatorView: View {
    @ObservedObject var coordinator: AppCoordinator
    @ObservedObject var localize: LocalizationManager

    var body: some View {
        switch coordinator.current {
        case .SELECT_LANGUAGE:
            SelectingLanguageView(localize: localize)
        case .MAIN:
            OnboardingView(viewmodel: OnboardingViewModel(usecase: QueryOnboardingUseCase(service: OnboardingService())))
        }
    }
}
