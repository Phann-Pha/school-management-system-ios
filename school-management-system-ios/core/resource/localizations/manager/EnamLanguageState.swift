import SwiftUI

enum EnamLanguageState: String {
    case EN = "en"
    case KH = "km-KH"

    var value: String { rawValue }

    static func from(_ value: String) -> EnamLanguageState {
        EnamLanguageState(rawValue: value) ?? .EN
    }
}
