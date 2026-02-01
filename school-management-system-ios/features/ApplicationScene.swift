import SwiftUI

@main
struct ApplicationScene: App {
    
    @StateObject private var coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(coordinator: coordinator)
        }
    }
}
