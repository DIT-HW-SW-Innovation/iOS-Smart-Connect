import SwiftUI

public enum DropdownVariant {
    case windows
    case android
    case iOS
}

public enum DropdownTheme {
    case light
    case dark
}

public struct MenuItem {
    let label: String
    let icon: IconName
    
    public init(label: String, icon: IconName) {
        self.label = label
        self.icon = icon
    }
}

public struct DropdownMenu: View {
    let buttonText: String
    let theme: DropdownTheme
    let variant: DropdownVariant
    let onItemClick: ((MenuItem) -> Void)?
    
    @State private var isOpen = false
    @State private var menuItems: [MenuItem] = [
        MenuItem(label: "Mute notifications", icon: .notificationOff),
        MenuItem(label: "Sync wallpaper", icon: .wallpaper),
        MenuItem(label: "Settings", icon: .settings)
    ]
    
    private let separatorItem = MenuItem(label: "Unpair device", icon: .linkOff)
    
    private var isMobileVariant: Bool {
        variant == .android || variant == .iOS
    }
    
    private var menuItemHeight: CGFloat {
        isMobileVariant ? 56 : 48
    }
    
    private var backgroundColor: Color {
        switch theme {
        case .light:
            return Color.white
        case .dark:
            return Color(red: 0.184, green: 0.196, blue: 0.227) // #2f323a
        }
    }
    
    private var textColor: Color {
        switch theme {
        case .light:
            return Color(red: 0.086, green: 0.110, blue: 0.153) // #161c27
        case .dark:
            return Color(red: 0.984, green: 0.984, blue: 0.988) // #fbfbfc
        }
    }
    
    private var buttonColor: Color {
        switch theme {
        case .light:
            return Color(red: 0.2, green: 0.2, blue: 0.2) // #333
        case .dark:
            return Color(red: 0.984, green: 0.984, blue: 0.988) // #fbfbfc
        }
    }
    
    public init(
        buttonText: String = "Click me",
        theme: DropdownTheme = .light,
        variant: DropdownVariant = .windows,
        onItemClick: ((MenuItem) -> Void)? = nil
    ) {
        self.buttonText = buttonText
        self.theme = theme
        self.variant = variant
        self.onItemClick = onItemClick
    }
    
    public var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                Button(action: {
                    withAnimation {
                        isOpen.toggle()
                    }
                }) {
                    Text(buttonText)
                        .font(.system(size: 18))
                        .underline()
                        .foregroundColor(buttonColor)
                }
                .buttonStyle(PlainButtonStyle())
                
                if isOpen {
                    VStack(spacing: 0) {
                        ForEach(Array(menuItems.enumerated()), id: \.offset) { index, item in
                            MenuItemView(
                                item: item,
                                theme: theme,
                                height: menuItemHeight
                            ) {
                                onItemClick?(item)
                                withAnimation {
                                    isOpen = false
                                }
                            }
                        }
                        
                        Divider()
                            .background(theme == .dark ? Color.white.opacity(0.18) : Color(red: 0.871, green: 0.851, blue: 0.831))
                            .padding(.vertical, 4)
                        
                        MenuItemView(
                            item: separatorItem,
                            theme: theme,
                            height: menuItemHeight
                        ) {
                            onItemClick?(separatorItem)
                            withAnimation {
                                isOpen = false
                            }
                        }
                    }
                    .padding(4)
                    .background(backgroundColor)
                    .cornerRadius(16)
                    .shadow(color: theme == .dark ? Color.black.opacity(0.35) : Color.black.opacity(0.1), radius: 12, x: 0, y: 4)
                    .frame(minWidth: 212, maxWidth: 332)
                    .offset(y: 40)
                    .transition(.opacity.combined(with: .scale))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .onTapGesture {
            if isOpen {
                withAnimation {
                    isOpen = false
                }
            }
        }
    }
}

private struct MenuItemView: View {
    let item: MenuItem
    let theme: DropdownTheme
    let height: CGFloat
    let onTap: () -> Void
    
    @State private var isHovered = false
    
    private var backgroundColor: Color {
        if isHovered {
            return theme == .dark ? Color.white.opacity(0.12) : Color.black.opacity(0.12)
        }
        return Color.clear
    }
    
    private var textColor: Color {
        theme == .dark ? Color(red: 0.984, green: 0.984, blue: 0.988) : Color(red: 0.086, green: 0.110, blue: 0.153)
    }
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 12) {
                Icon(name: item.icon, size: 20)
                    .foregroundColor(textColor)
                
                Text(item.label)
                    .font(.system(size: 16, weight: .regular))
                    .kerning(0.5)
                    .foregroundColor(textColor)
                    .lineLimit(1)
                
                Spacer()
            }
            .padding(.horizontal, 12)
            .frame(height: height)
            .background(backgroundColor)
            .cornerRadius(12)
        }
        .buttonStyle(PlainButtonStyle())
        .onHover { hovering in
            isHovered = hovering
        }
    }
}
