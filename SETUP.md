# SC-iOS Setup Instructions

## Prerequisites

- macOS (required for Xcode)
- Xcode 14.0 or later
- Swift 5.9 or later

## Project Structure

This is a Swift Package Manager project. You can use it in two ways:

### Option 1: Create Xcode Project

1. Open Xcode
2. File → New → Project
3. Select "App" (iOS or macOS)
4. In your project, go to File → Add Package Dependencies
5. Add this local package by selecting the `SC-iOS` folder

### Option 2: Use as Swift Package

1. Open Xcode
2. File → New → Package
3. Select the `SC-iOS` folder
4. Build the package (Cmd+B)

## Adding Assets

### Images
1. Add PNG images to `Sources/SCComponents/Assets/`
2. Images should be named: `lenovo_tabp12.png`, `lenovo_thinkpad.png`, `moto_edge_60_pro.png`

### Icons
1. Add SVG icons to `Sources/SCComponents/Icons/`
2. Icons should match the IconName enum cases
3. Update the Icon component to load from the correct asset catalog

## Storybook Setup

**Note**: Storybook for SwiftUI is still in development. The story files are provided as a template, but you may need to:

1. Install Storybook for SwiftUI separately
2. Configure the build system
3. Adjust the story syntax based on the actual Storybook for SwiftUI API

Alternatively, you can:
- Use Xcode Previews instead
- Create a simple demo app (see `SCComponentsApp.swift`)

## Using Components

```swift
import SCComponents

// FilterChip
FilterChip(
    text: "My Chip",
    variant: .textOnly,
    stage: .enabled,
    theme: .light
)

// DropdownMenu
DropdownMenu(
    buttonText: "Click me",
    theme: .light,
    variant: .windows
)

// FilterChipExample
FilterChipExample(theme: .light)
```

## Known Limitations

1. **Icons**: The Icon component currently expects images in the asset catalog. You'll need to:
   - Create an Asset Catalog in Xcode
   - Add SVG icons as image sets
   - Update Icon.swift to use `Image()` with the asset names

2. **State Management**: FilterChip uses internal state. For controlled state, you may need to modify the component to accept a Binding.

3. **Platform Differences**: Some styling may need adjustment for iOS vs macOS.

## Testing on macOS

Once you have macOS access:

1. Open the project in Xcode
2. Select a target (iOS Simulator or macOS)
3. Build and run (Cmd+R)
4. Test the components

## Next Steps

1. Add icons to Xcode Asset Catalog
2. Test components in Xcode Previews
3. Adjust styling for platform-specific needs
4. Set up Storybook (if using)
5. Add unit tests
