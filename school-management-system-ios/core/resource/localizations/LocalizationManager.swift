import Combine
import Foundation

class LocalizationManager: ObservableObject {
    @Published var current: String = LangEnamStatus.EN.value
    @Published var locale: Locale = Locale(identifier: LangEnamStatus.EN.value)

    func onSetChangeLangue(_ language: String) {
        current = language
        locale = Locale(identifier: current)
        UserDefaults.standard.set([current], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
}
