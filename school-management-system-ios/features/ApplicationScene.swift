import SwiftUI

@main
struct ApplicationScene: App {
    @StateObject private var coordinator = AppCoordinator()
    @StateObject private var localizationManager: LocalizationManager = LocalizationManager()

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(
                localizationManager: localizationManager,
                coordinator: coordinator
            )
        }
    }
}
