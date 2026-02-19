
import Foundation

class QueryOnboardingUseCase {
    private let service: OnboardingService
    init(service: OnboardingService) {
        self.service = service
    }

    func invoke() -> [OnboardingModel] {
        return service.fetchPages()
    }
}
