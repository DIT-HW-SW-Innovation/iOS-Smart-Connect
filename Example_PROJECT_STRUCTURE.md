# SC-Android Project Structure

This document describes the structure of the SC-Android project. The project has been organized following Android development conventions, with the goal of implementing the same basic functionality as the Vue.js components.

## Why This Structure?

The project follows Android development conventions. The structure separates code, resources, and build configuration in the standard Android way.

## The Main Folders

```
SC-Android/
├── app/src/main/java/com/sc/android/  # Main application code
│   ├── components/                    # Custom UI components
│   │   ├── FilterChip.kt             # FilterChip component
│   │   └── DropdownMenu.kt           # DropdownMenu component
│   ├── MainActivity.kt               # Main activity
│   └── FilterChipExampleActivity.kt  # Example activity
├── app/src/main/res/                  # Android resources
│   ├── drawable/                      # Icons and images
│   ├── layout/                        # XML layouts
│   └── values/                        # Colors, dimensions, strings
└── build files                         # Build configuration
```

## The Components

### FilterChip Component

The FilterChip component has three variants:
- **TEXT_ONLY**: Text-only chips
- **PNG_TEXT**: Chips with PNG images and text
- **SVG_TEXT**: Chips with vector icons and text

Features:
- Three states: Enabled, Hovered, and Selected
- Support for light and dark themes
- Clickable with selection logic
- Customizable properties

The component extends LinearLayout and includes ImageViews for icons/images and a TextView for text.

### DropdownMenu Component

The DropdownMenu provides a dropdown interface with different styling variants for Windows, Android, and iOS.

Features:
- Click-outside-to-close behavior
- Light and dark theme support
- Customizable menu items
- Uses CardView for styling

## Activities

### MainActivity
This activity contains the DropdownMenu component with example options.

### FilterChipExampleActivity
This activity contains FilterChip examples:
- Device row with PNG images (Lenovo ThinkPad, Moto Edge, Lenovo Tab)
- File type row with SVG icons (audio, documents, images, etc.)

## Resources

### Drawables
SVG icons have been converted to Android Vector Drawables in the drawable folder:
- File type icons: audio.xml, documents.xml, downloads.xml, etc.
- Device images: lenovo_thinkpad.png, moto_edge_60_pro.png
- UI icons: menu.xml, settings.xml, notification_off.xml

### Values
Design tokens are organized in the values folder:
- **colors.xml**: Colors for light and dark themes
- **dimens.xml**: Spacing and sizing values
- **strings.xml**: Text strings
- **themes.xml**: Material Components theme

## Technical Decisions

### Kotlin
All code is written in Kotlin, which is the recommended language for modern Android development.

### ViewBinding
ViewBinding is enabled for type-safe view access.

### Material Components
The project uses Google's Material Components library for styling and behavior.

### Custom Views
Components are implemented as custom Views rather than Fragments.

### Minimum SDK
The minimum SDK is set to API 24 (Android 7.0).

## Build Configuration

The project uses:
- **Gradle 8.1.2**
- **Kotlin 1.9.20**
- **Material Components**
- **ConstraintLayout and CardView**

## Dependencies

- **AndroidX Core KTX**: Kotlin extensions
- **AppCompat**: Backward compatibility
- **Material Components**: Design system
- **ConstraintLayout**: Layout system
- **CardView**: Card styling

## Notes

When working with these components:
1. Set theme before other properties
2. Check the example activities to see usage
3. SVG icons are already converted to XML format
4. ViewBinding is enabled for view access

The components are designed to be extensible if needed. We'll need to test them thoroughly before production use.

Questions? Let's discuss the implementation. 🤝