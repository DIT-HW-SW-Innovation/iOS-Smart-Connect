# SC iOS Components (SwiftUI)

This repository contains a Swift Package (`SCComponents`) that implements a small set of UI components in SwiftUI.

This project is **not yet verified in a real app build**. Please treat it as a starting point and validate behavior, layout, and assets in your local Xcode environment before shipping anything.

## What’s in here

- **`FilterChip`**: a chip-style control with multiple presentation variants and visual states.
- **`DropdownMenu`**: a dropdown menu component with multiple style variants (see `DropdownMenu.Variant` in code).
- **`Icon`**: a small icon view backed by the icon registry and packaged resources (see `IconRegistry.swift` and the `Icons/` folder).
- **Examples/Previews**: views intended for manual inspection in Xcode previews (see `Sources/SCComponents/Stories/`).

## Requirements (expected)

- Xcode (recent version)
- Swift 5.9+
- Deployment targets are declared in `Package.swift` (use that as the source of truth)

## Using the package in an app

Use Xcode’s “Add Package Dependencies…” and point to this repo folder as a **local** package, then import `SCComponents`.

Minimal usage example:

```swift
import SCComponents

FilterChip(
    text: "Example",
    variant: .textOnly,
    stage: .enabled,
    theme: .light
)
```

## Assets and resources (please verify locally)

This package includes image/icon resources under `Sources/SCComponents/Assets/` and `Sources/SCComponents/Icons/`.

Before relying on them, please confirm:

- The resources are included in the built product (SPM resources behavior can differ depending on how you integrate).
- The `Icon` component resolves the expected icon names for your usage.
- Any images referenced by components exist and load correctly at runtime.

## Development notes

- If you add/rename icons, update the registry in `Sources/SCComponents/IconRegistry.swift`.
- Keep changes small and test frequently with Xcode previews and/or a small host app.
- If something looks “almost right”, prefer filing an issue with screenshots and device/OS info rather than guessing at values.

## What this README is (and isn’t)

- **Is**: a high-level guide for developers integrating or extending the package.
- **Isn’t**: a claim that the package is production-ready or fully tested.
