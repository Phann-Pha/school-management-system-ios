enum LangEnamStatus {
    case EN, KH

    var value: String {
        switch self {
        case .EN: return "en"
        case .KH: return "km-KH"
        }
    }
}
