
import SwiftUI

struct AppCoordinatorView: View {
    
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        switch coordinator.current {
        case .splash:
            GettingStartedView()
        case .main:
            OnboardingView(viewmodel: OnboardingViewModel(usecase: QueryOnboardingUseCase(service: OnboardingService())))
        }
    }
}
