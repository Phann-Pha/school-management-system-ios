
import SwiftUI

struct AppCoordinatorView: View {
    
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        switch coordinator.current {
        case .splash:
            SelectingLanguageView()
        case .main:
            OnboardingView(viewmodel: OnboardingViewModel(usecase: QueryOnboardingUseCase(service: OnboardingService())))
        }
    }
}
