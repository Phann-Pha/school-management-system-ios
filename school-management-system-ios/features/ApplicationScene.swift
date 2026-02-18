import SwiftUI

@main
struct ApplicationScene: App {
    @StateObject private var coordinator = AppCoordinator()
    @StateObject private var localize: LocalizationManager = LocalizationManager()
    
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(coordinator: coordinator, localize: localize)
        }
    }
}
