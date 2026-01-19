# SC-iOS Project Structure

```
SC-iOS/
├── Package.swift                    # Swift Package Manager configuration
├── README.md                        # Project documentation
├── SETUP.md                         # Setup instructions
├── .gitignore                       # Git ignore rules
├── .storybook/                      # Storybook configuration (if using)
│   └── main.ts
│
├── Sources/
│   └── SCComponents/                # Main package source
│       ├── SCComponentsApp.swift   # Demo app entry point
│       ├── IconRegistry.swift      # Icon name definitions
│       │
│       ├── Components/              # SwiftUI components
│       │   ├── Icon.swift          # Icon component
│       │   ├── FilterChip.swift    # FilterChip component
│       │   └── DropdownMenu.swift  # DropdownMenu component
│       │
│       ├── Stories/                 # Story/Preview files
│       │   ├── FilterChipExample.swift          # FilterChipExample view
│       │   ├── FilterChip.stories.swift         # FilterChip previews
│       │   ├── FilterChipExample.stories.swift # FilterChipExample previews
│       │   └── DropdownMenu.stories.swift       # DropdownMenu previews
│       │
│       ├── Assets/                  # Image assets
│       │   ├── lenovo_tabp12.png
│       │   ├── lenovo_thinkpad.png
│       │   └── moto_edge_60_pro.png
│       │
│       └── Icons/                   # SVG icon assets
│           ├── audio.svg
│           ├── documents.svg
│           ├── downloads.svg
│           ├── images.svg
│           ├── link_off.svg
│           ├── menu.svg
│           ├── notification_off.svg
│           ├── recent.svg
│           ├── settings.svg
│           ├── videos.svg
│           └── wallpaper.svg
│
└── Tests/                           # Unit tests (to be added)
```

## Component Files

### Core Components
- **Icon.swift**: Renders SVG icons from assets
- **FilterChip.swift**: Filter chip with text-only, PNG-text, and SVG-text variants
- **DropdownMenu.swift**: Dropdown menu with Windows, Android, and iOS variants

### Stories/Examples
- **FilterChipExample.swift**: Interactive example showing FilterChip usage
- **FilterChip.stories.swift**: Xcode Previews for FilterChip
- **FilterChipExample.stories.swift**: Xcode Previews for FilterChipExample
- **DropdownMenu.stories.swift**: Xcode Previews for DropdownMenu

## Notes

- All components use SwiftUI
- Components are public for external use
- Xcode Previews are used instead of Storybook (more standard for SwiftUI)
- Assets are included in the package resources
