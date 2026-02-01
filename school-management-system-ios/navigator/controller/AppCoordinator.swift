
import Combine
import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var current: ScreenRoutor = .splash

    func switchTo(_ screen: ScreenRoutor) {
        withAnimation { self.current = screen }
    }
}
