# Project structure (developer notes)

This document is a map of the repository for anyone integrating or extending `SCComponents`.

Because the package is not yet fully verified in a host application, treat anything that depends on build settings / SPM resource packaging / preview behavior as **“verify locally in Xcode”**.

## Top level

```
SC-iOS/
├── Package.swift                    # Swift Package Manager configuration (source of truth)
├── README.md                        # Developer-oriented overview
├── SETUP.md                         # Setup notes (may need adjustment for your environment)
├── PROJECT_STRUCTURE.md             # This file
├── .gitignore
│
├── Sources/
│   └── SCComponents/                # Package module: `SCComponents`
│       ├── SCComponentsApp.swift    # Demo entry point / sandbox (if used)
│       ├── IconRegistry.swift       # Icon name definitions / registry
│       │
│       ├── Components/              # SwiftUI components
│       │   ├── Icon.swift
│       │   ├── FilterChip.swift
│       │   └── DropdownMenu.swift
│       │
│       ├── Stories/                 # Preview/example views for manual inspection
│       │   ├── FilterChipExample.swift
│       │   ├── FilterChip.stories.swift
│       │   ├── FilterChipExample.stories.swift
│       │   └── DropdownMenu.stories.swift
│       │
│       ├── Assets/                  # Image resources (verify they’re packaged + load correctly)
│       │   ├── lenovo_tabp12.png
│       │   ├── lenovo_thinkpad.png
│       │   └── moto_edge_60_pro.png
│       │
│       └── Icons/                   # Icon resources (verify naming + loading path)
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
└── Tests/                           # Unit tests (currently minimal / placeholder)
```

## Key files

### `Package.swift`

- Defines the `SCComponents` module, its targets, and how resources are bundled.
- If something doesn’t load at runtime (especially assets), start your investigation here.

### `Sources/SCComponents/Components/*`

- `FilterChip.swift`: chip UI and interaction/state handling.
- `DropdownMenu.swift`: menu UI and variant styling (see the `Variant` type in code rather than relying on docs).
- `Icon.swift`: icon rendering logic; behavior depends on how icons are packaged and resolved.

### `Sources/SCComponents/Stories/*`

- Intended for manual inspection via Xcode previews and/or a small sandbox.
- Treat these as examples/templates, not as a formal test suite.

## Notes / assumptions to validate

- Resources under `Assets/` and `Icons/` are expected to be packaged via Swift Package resources; confirm at runtime in your integration target.
- Preview behavior can differ from real runtime behavior (especially around resources and layout). Always validate in a host app for final UI.
