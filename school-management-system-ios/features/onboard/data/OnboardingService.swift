import SwiftUI

class OnboardingService: OnboardingServiceProtocol {
     func fetchPages() -> [OnboardingModel] {
        let pages: [OnboardingModel] = [
            OnboardingModel(
                title: "Welcome",
                description: "Discover new features",
                image: "onboard1"),
            OnboardingModel(
                title: "Stay Organized",
                description: "Manage your tasks",
                image: "onboard2"),
            OnboardingModel(
                title: "Achieve More",
                description: "Boost productivity",
                image: "onboard3"),
        ]
        return pages
    }
}
