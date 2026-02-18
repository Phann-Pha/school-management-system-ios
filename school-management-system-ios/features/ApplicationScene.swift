import SwiftUI

@main
struct ApplicationScene: App {
    @AppStorage("SelectedLangeuage") var selectedLanguage: String = Locale.current.language.languageCode?.identifier ?? "kh"

    init() {
       // Bundle.setAccessibilityLanguage(selectedLanguage)
    }

    @StateObject private var coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(coordinator: coordinator)
        }
    }
}
