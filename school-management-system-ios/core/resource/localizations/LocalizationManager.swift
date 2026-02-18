import Combine
import Foundation

class LocalizationManager: ObservableObject {
    @Published var currentLanguage: String = LangEnamStatus.KH.value
    func onSetChangeLangue(_ lang: String) {
        currentLanguage = lang
        UserDefaults.standard.set([lang], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
}
