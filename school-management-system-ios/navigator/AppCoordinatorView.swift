
import SwiftUI

struct AppCoordinatorView: View {
    
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        switch coordinator.current {
        case .splash:
            SplashContentView(coordinator: coordinator)
        case .main:
            MainContentView()
        }
    }
}
