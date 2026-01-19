import SwiftUI

public enum FilterChipVariant {
    case textOnly
    case pngText
    case svgText
}

public enum FilterChipStage {
    case enabled
    case hovered
    case selected
}

public enum FilterChipTheme {
    case light
    case dark
}

public struct FilterChip: View {
    let text: String
    let variant: FilterChipVariant
    @Binding var stage: FilterChipStage
    let theme: FilterChipTheme
    let imageSrc: String?
    let iconName: IconName?
    let onTap: (() -> Void)?
    
    @State private var isHovered = false
    
    public init(
        text: String,
        variant: FilterChipVariant = .textOnly,
        stage: Binding<FilterChipStage> = .constant(.enabled),
        theme: FilterChipTheme = .light,
        imageSrc: String? = nil,
        iconName: IconName? = nil,
        onTap: (() -> Void)? = nil
    ) {
        self.text = text
        self.variant = variant
        self._stage = stage
        self.theme = theme
        self.imageSrc = imageSrc
        self.iconName = iconName
        self.onTap = onTap
    }
    
    private var backgroundColor: Color {
        switch (stage, theme) {
        case (.selected, .light):
            return Color(red: 0.835, green: 0.890, blue: 1.0) // #d5e3ff
        case (.selected, .dark):
            return Color(red: 0.835, green: 0.890, blue: 1.0).opacity(0.2)
        case (.hovered, .light):
            return Color.black.opacity(0.12)
        case (.hovered, .dark):
            return Color.white.opacity(0.12)
        case (.enabled, _):
            return Color.clear
        }
    }
    
    private var borderColor: Color {
        if stage == .selected {
            return Color.clear
        }
        switch theme {
        case .light:
            return Color(red: 0.871, green: 0.851, blue: 0.831) // #ded9d4
        case .dark:
            return Color(red: 0.224, green: 0.231, blue: 0.251) // #393B40
        }
    }
    
    private var textColor: Color {
        switch (stage, theme) {
        case (.selected, _):
            return Color(red: 0.0, green: 0.114, blue: 0.208) // rgba(0, 29, 53, 1)
        case (.hovered, .light):
            return Color(red: 0.0, green: 0.114, blue: 0.208)
        case (.hovered, .dark):
            return Color(red: 0.792, green: 0.776, blue: 0.761) // #CAC6C2
        case (.enabled, .light):
            return Color(red: 0.373, green: 0.369, blue: 0.376) // rgba(95, 94, 96, 1)
        case (.enabled, .dark):
            return Color(red: 0.792, green: 0.776, blue: 0.761) // #CAC6C2
        }
    }
    
    private var padding: EdgeInsets {
        switch variant {
        case .textOnly:
            return EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        case .pngText:
            return EdgeInsets(top: 1.92, leading: 11.04, bottom: 1.92, trailing: 16)
        case .svgText:
            return EdgeInsets(top: 8, leading: 11.04, bottom: 8, trailing: 16)
        }
    }
    
    private var spacing: CGFloat {
        switch variant {
        case .textOnly, .svgText:
            return 8
        case .pngText:
            return 4
        }
    }
    
    public var body: some View {
        Button(action: {
            handleTap()
        }) {
            HStack(spacing: spacing) {
                if variant == .pngText, let imageSrc = imageSrc {
                    Image(imageSrc)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 16, height: 16)
                        .clipShape(RoundedRectangle(cornerRadius: 2))
                }
                
                if variant == .svgText, let iconName = iconName {
                    Icon(name: iconName, size: 16)
                }
                
                Text(text)
                    .font(.system(size: 12, weight: .bold, design: .default))
                    .kerning(0.5)
                    .lineLimit(1)
            }
            .padding(padding)
            .background(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: 999)
                    .stroke(borderColor, lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 999))
        }
        .buttonStyle(PlainButtonStyle())
        .foregroundColor(textColor)
        .onHover { hovering in
            isHovered = hovering
            if hovering && stage == .enabled {
                stage = .hovered
            } else if !hovering && stage == .hovered {
                stage = .enabled
            }
        }
    }
    
    private func handleTap() {
        if stage == .selected {
            stage = .enabled
        } else if stage == .enabled || stage == .hovered {
            stage = .selected
        }
        onTap?()
    }
}
