
import SwiftUI

struct AppCoordinatorView: View {
    @ObservedObject var localizationManager: LocalizationManager
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        switch coordinator.current {
        case .SELECT_LANGUAGE:
            SelectingLanguageView(localizationManager: localizationManager)
        case .MAIN:
            OnboardingView(viewmodel: OnboardingViewModel(usecase: QueryOnboardingUseCase(service: OnboardingService())))
        }
    }
}
