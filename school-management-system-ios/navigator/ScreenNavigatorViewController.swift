
import Combine
import SwiftUI

class ScreenNavigatorViewController: ObservableObject {
    
    @Published var current: ScreenRouter = .language

    func navigate(_ screen: ScreenRouter) {
        withAnimation {
            self.current = screen
        }
    }
}
