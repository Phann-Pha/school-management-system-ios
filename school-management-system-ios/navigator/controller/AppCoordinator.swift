
import Combine
import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var current: ScreenRoutor = .SELECT_LANGUAGE

    func switchTo(_ screen: ScreenRoutor) {
        withAnimation { self.current = screen }
    }
}
