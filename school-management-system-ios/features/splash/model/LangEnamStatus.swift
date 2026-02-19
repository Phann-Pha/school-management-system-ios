import SwiftUI

enum LangEnamStatus: String {
    case EN = "en"
    case KH = "km-KH"

    var value: String { rawValue }

    static func from(_ value: String) -> LangEnamStatus {
        LangEnamStatus(rawValue: value) ?? .EN
    }
}
