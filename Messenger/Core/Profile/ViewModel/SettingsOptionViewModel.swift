//
//  SettingsOptionViewModel.swift
//  Messenger
//
//  Created by ahmet karadağ on 25.12.2024.
//

import Foundation
import SwiftUI

enum SettingsOptionViewModel: Int, CaseIterable, Identifiable{
    var id : Int { self.rawValue }
    
    case darkmode
    case privacy
    case activeStatus
    case notifications
    case accessibility
    
    var title: String {
        switch self {
            case .darkmode: return "Dark Mode"
        case .privacy: return "Privacy"
        case .activeStatus: return "Active Status"
        case .notifications: return "Notifications"
        case .accessibility: return "Accessibility"
        }
    }
    var imageName: String {
        switch self {
        case .darkmode: return "moon.circle.fill"
        case .privacy: return "lock.circle.fill"
        case .activeStatus: return "message.badge.circle.fill"
        case .notifications: return "bell.circle.fill"
        case .accessibility: return "accessibility"
        }
    }
    var backgroundColor: Color {
        switch self {
        case .darkmode: return .black
        case .privacy: return Color(.systemBlue)
        case .activeStatus: return Color(.systemGreen)
        case .notifications: return Color(.systemPurple)
        case .accessibility: return .black
        }
    }
}
