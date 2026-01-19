# SC-iOS Components

Swift/SwiftUI version of the SC components, targeting both iOS and macOS.

## Components

- **FilterChip**: A filter chip component with text-only, PNG-text, and SVG-text variants
- **DropdownMenu**: A dropdown menu component with Windows, Android, and iOS variants
- **Icon**: An icon component that renders SVG icons
- **FilterChipExample**: Example view demonstrating FilterChip usage

## Project Structure

```
SC-iOS/
├── Sources/
│   └── SCComponents/
│       ├── Components/
│       │   ├── Icon.swift
│       │   ├── FilterChip.swift
│       │   └── DropdownMenu.swift
│       ├── Stories/
│       │   └── FilterChipExample.swift
│       ├── IconRegistry.swift
│       └── Assets/          # Image assets
│       └── Icons/           # SVG icon assets
├── Tests/
├── Package.swift
└── README.md
```

## Requirements

- Xcode 14.0 or later
- Swift 5.9 or later
- iOS 15.0+ / macOS 12.0+

## Setup

### Using Swift Package Manager

1. Open Xcode
2. File → New → Project
3. Select "Swift Package"
4. Add this package as a dependency

### Using Xcode Project

1. Open the project in Xcode
2. Build the project (Cmd+B)
3. Run Storybook (if configured)

## Components Overview

### FilterChip

A filter chip component with three variants:
- `textOnly`: Text only
- `pngText`: PNG image + text
- `svgText`: SVG icon + text

States: `enabled`, `hovered`, `selected`
Themes: `light`, `dark`

### DropdownMenu

A dropdown menu component with platform variants:
- `windows`: Windows style
- `android`: Android style
- `iOS`: iOS style

Themes: `light`, `dark`

### Icon

Renders SVG icons from the icon registry. Icons are loaded from the Assets/Icons folder.

## Storybook for SwiftUI

This project is set up to work with Storybook for SwiftUI. To use Storybook:

1. Install Storybook for SwiftUI dependencies
2. Configure your Xcode project to use Storybook
3. Create story files in the Stories directory

**Note**: Storybook for SwiftUI setup requires additional configuration. See the Storybook documentation for SwiftUI setup instructions.

## Differences from Vue Version

1. **State Management**: Uses SwiftUI's `@State` instead of Vue's `ref`
2. **Styling**: Uses SwiftUI modifiers instead of CSS
3. **Icons**: Icons are loaded as image assets instead of inline SVG
4. **Platform**: Native iOS/macOS instead of web

## Development

### Adding New Components

1. Create a new Swift file in `Sources/SCComponents/Components/`
2. Follow the existing component patterns
3. Add public access modifiers for external use

### Adding Assets

1. Add images to `Sources/SCComponents/Assets/`
2. Add icons to `Sources/SCComponents/Icons/`
3. Update `Package.swift` if needed

## Testing

Tests can be added in the `Tests/` directory. Use XCTest for unit tests.

## Notes

- This project was untested
- Some adjustments may be needed when testing
- Icon assets need to be added to the Icons folder
- Image assets need to be added to the Assets folder
