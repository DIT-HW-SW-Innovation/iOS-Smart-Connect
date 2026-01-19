import SwiftUI

public enum IconName: String, CaseIterable {
    case audio = "audio"
    case documents = "documents"
    case downloads = "downloads"
    case images = "images"
    case linkOff = "link_off"
    case menu = "menu"
    case notificationOff = "notification_off"
    case recent = "recent"
    case settings = "settings"
    case videos = "videos"
    case wallpaper = "wallpaper"
}

public struct IconRegistry {
    public static func iconName(for rawValue: String) -> IconName? {
        return IconName(rawValue: rawValue)
    }
    
    public static var allIconNames: [IconName] {
        return IconName.allCases
    }
}
