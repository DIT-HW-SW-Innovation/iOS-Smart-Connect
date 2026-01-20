## What's This Project About?

This project provides native Android versions of the core UI components from the Vue.js SC project. The components have been adapted to work on Android, maintaining the same basic functionality and design principles while using Android's native capabilities.

## The Two Main Components

### FilterChip Component

Our FilterChip is a component that comes in three variants:
- **Text Only**: Simple text chips for basic filtering
- **PNG Text**: Chips that include PNG images alongside text
- **SVG Text**: Chips with vector icons and text

Each chip supports three interaction states (Enabled, Hovered, Selected) and includes support for both light and dark themes. The chips are clickable and provide visual feedback when selected.

**Usage example:**
```kotlin
val filterChip = findViewById<FilterChip>(R.id.filterChip)
filterChip.text = "All devices"
filterChip.setVariant(FilterChip.Variant.TEXT_ONLY)
filterChip.setTheme(FilterChip.Theme.LIGHT)
```

### DropdownMenu Component

The DropdownMenu provides a dropdown interface with different styling variants. It supports Windows, Android, and iOS styling options.

Key features:
- Dropdown interface with customizable items
- Click-outside-to-close behavior
- Support for light/dark themes
- Different styling variants

**Usage example:**
```kotlin
val dropdownMenu = findViewById<DropdownMenu>(R.id.dropdownMenu)
dropdownMenu.buttonText = "Choose option"
dropdownMenu.setTheme(DropdownMenu.Theme.LIGHT)
dropdownMenu.onItemClick = { item ->
    // Handle your selection logic here
}
```

## Project Architecture

The project follows Android development practices:
- **Kotlin**: All code is written in Kotlin
- **ViewBinding enabled**: For view access
- **Material Components**: Using Google's Material Design library
- **Custom Views**: Components extend native Android views

## Activities You'll Work With

- **MainActivity**: Contains the DropdownMenu component
- **FilterChipExampleActivity**: Contains FilterChip usage examples

## Resources We've Set Up

SVG icons have been converted to Android Vector Drawables and placed in the drawable folder. The project includes:
- Vector icons for file types (audio, documents, downloads, etc.)
- PNG images for device representations (Lenovo ThinkPad, Moto Edge, Lenovo Tab)
- Color schemes for light and dark themes
- Dimensions and spacing values

## Technical Details

- **Min SDK**: 24 (Android 7.0)
- **Target SDK**: 34 (Android 14)
- **Material Design**: Using Material Design patterns
- **View-based**: Uses custom views instead of fragments

## Getting Started

The assets are already set up, so you can:
1. Open the project in Android Studio
2. Sync Gradle
3. Run on your device or emulator

The FilterChipExampleActivity shows how the components work - it includes both PNG and SVG variants.

## Next Steps

This project provides Android versions of our web components. The goal is to maintain consistency across platforms. We'll need to test these components thoroughly before using them in production.

Feel free to reach out if you have questions about the implementation.

## License

Same as our original SC project.