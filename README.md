## What's This Project About?

This project provides SwiftUI versions of a small set of core UI components from our Vue-based SC project. The goal is to keep the same general UX and design intent, but implement it using native SwiftUI patterns.

This package is **not yet fully verified in a real host app**. Please treat it as a baseline implementation and validate behavior, layout, and resource loading locally before relying on it for production.

## The Main Components

### FilterChip Component

`FilterChip` is a chip-like UI element that supports multiple presentation variants and interaction stages.

What to verify locally:
- Variant rendering (text-only, image+text, icon+text)
- State transitions (e.g. enabled/hovered/selected) in your target environment
- Layout and colors in both light/dark themes

**Usage example:**

```swift
import SCComponents

FilterChip(
    text: "All devices",
    variant: .textOnly,
    stage: .enabled,
    theme: .light
)
```

### DropdownMenu Component

`DropdownMenu` provides a button-triggered menu with selectable items and multiple styling variants (see the `DropdownVariant` type in code).

What to verify locally:
- Opening/closing behavior (including tap/click outside behavior)
- Variant-specific sizing and spacing
- Theming (light/dark)

**Usage example:**

```swift
import SCComponents

DropdownMenu(
    buttonText: "Choose option",
    theme: .light
)
```

### Icon Component

`Icon` is backed by `IconRegistry.swift` and the packaged icon resources under `Sources/SCComponents/Icons/`.

Because resource loading can vary depending on how the package is integrated, please confirm locally that:
- The icon names you use map to actual assets
- The assets are bundled and load correctly at runtime

## Project Architecture

The code follows typical Swift Package + SwiftUI organization:
- **Swift Package Manager**: module + resources are defined in `Package.swift`
- **SwiftUI views**: components live under `Sources/SCComponents/Components/`
- **Examples/Previews**: under `Sources/SCComponents/Stories/` for manual inspection

## Resources We've Set Up (verify locally)

The package includes:
- PNG images under `Sources/SCComponents/Assets/`
- SVG icon files under `Sources/SCComponents/Icons/`

Please verify in your integration target that these resources are actually bundled and accessible at runtime.

## Technical Details

- Swift 5.9+ (as expected by this repo)
- Deployment targets are declared in `Package.swift` (treat that as the source of truth)

## Getting Started

1. Open Xcode and add this repo as a **local Swift package** dependency.
2. Import `SCComponents` and render a component in a small host app screen.
3. Use the views in `Sources/SCComponents/Stories/` as a reference for expected appearance, but validate in a real run as well.

## Next Steps

- Add a minimal host app screen that exercises each variant/state you care about.
- Add snapshot/UI tests once the expected rendering is confirmed.
- Tighten up resource handling if icons/images don’t load consistently in your integration.
