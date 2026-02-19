import SwiftUI

@main
struct MyApp: App {
    
    @StateObject private var navigator: ScreenNavigatorViewController = ScreenNavigatorViewController()
    @StateObject private var localize: LocalizationManager = LocalizationManager()

    var body: some Scene {
        WindowGroup {
            
            ScreenNavigatorView(navigator: navigator,localize: localize)
            .environment(\.locale, localize.locale)
        }
    }
}
