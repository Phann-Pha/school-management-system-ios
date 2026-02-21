//
//  OnboardPage.swift
//  school-management-system-ios
//
//  Created by Pha on 21/2/26.
//

import SwiftUI

enum OnboardPage: Int, CaseIterable {
    case one
    case two
    case three

    var description: String {
        return switch self {
        case .one: "OnboardDescription1"
        case .two: "OnboardDescription2"
        case .three: "OnboardDescription3"
        }
    }
    
    var lottieName: String {
        return switch self {
        case .one: "analyze_anim.json"
        case .two: "scanning_anim.json"
        case .three: "listing_anim.json"
        }
    }
}
