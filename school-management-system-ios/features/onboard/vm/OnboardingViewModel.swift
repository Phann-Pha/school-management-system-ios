
import Combine
import SwiftUI

class OnboardingViewModel: ObservableObject {
    
    private let usecase: QueryOnboardingUseCase
    init(usecase: QueryOnboardingUseCase) {
        self.usecase = usecase
        self.fetchPages()
    }
    @Published var pages: [OnboardingModel] = []

    private func fetchPages() {
        let pages =  usecase.invoke()
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.pages = pages
        }
    }
}
