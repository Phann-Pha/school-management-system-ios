import Combine
import Foundation

@MainActor
final class LocalizationManager: ObservableObject {

    private let key = "AppleLanguages"

    @Published var current: String
    @Published var locale: Locale
    @Published var defaultLanguage: EnamLanguageState

    init() {
        let savedLanguage = UserDefaults.standard.stringArray(forKey: key)?.first ?? EnamLanguageState.EN.value

        self.current = savedLanguage
        self.locale = Locale(identifier: savedLanguage)
        self.defaultLanguage = EnamLanguageState.from(savedLanguage)
    }

    func onSetChangeLangue(_ language: String) {
        current = language
        locale = Locale(identifier: language)
        defaultLanguage = EnamLanguageState.from(language)

        UserDefaults.standard.set([language], forKey: key)
    }
}
