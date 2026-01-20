# SC iOS Project Structure

This document describes the structure of the `SCComponents` Swift package. The layout follows common Swift Package conventions, with the goal of keeping components, examples, and resources easy to find.

Because the package is not yet fully verified in a host application, treat anything involving resources and preview/runtime behavior as **verify locally in Xcode**.

## Why This Structure?

- Keep reusable SwiftUI components isolated under one module (`SCComponents`)
- Keep example/previews separate from the components themselves
- Keep resources (images/icons) packaged alongside the module

## The Main Folders

```
SC-iOS/
├── Package.swift                      # Swift Package Manager configuration
├── README.md                          # Project overview (developer-facing)
├── SETUP.md                           # Setup notes (may need adjustment)
├── PROJECT_STRUCTURE.md               # This file
├── .gitignore
│
├── Sources/
│   └── SCComponents/                  # Module source: `SCComponents`
│       ├── Components/                # SwiftUI components
│       │   ├── FilterChip.swift
│       │   ├── DropdownMenu.swift
│       │   └── Icon.swift
│       │
│       ├── Stories/                   # Examples / Xcode previews (manual inspection)
│       │   ├── FilterChipExample.swift
│       │   ├── FilterChip.stories.swift
│       │   ├── FilterChipExample.stories.swift
│       │   └── DropdownMenu.stories.swift
│       │
│       ├── Assets/                    # PNG resources (verify they bundle + load)
│       ├── Icons/                     # SVG icon files (verify naming + loading)
│       ├── IconRegistry.swift         # Icon name definitions / registry
│       └── SCComponentsApp.swift      # Demo entry point / sandbox (if used)
│
└── Tests/                             # Unit tests (currently minimal / placeholder)
```

## The Components

### FilterChip

Located at `Sources/SCComponents/Components/FilterChip.swift`.

Notes:
- Supports multiple variants and interaction stages.
- Validate behavior in a host app, not only previews.

### DropdownMenu

Located at `Sources/SCComponents/Components/DropdownMenu.swift`.

Notes:
- Styling is controlled by a variant type in code.
- Verify menu open/close behavior and layout in your integration target.

### Icon + IconRegistry

Located at:
- `Sources/SCComponents/Components/Icon.swift`
- `Sources/SCComponents/IconRegistry.swift`

Notes:
- If an icon doesn’t render, confirm the name exists in the registry and that resources are bundled via `Package.swift`.

## Resources

### Assets (`Assets/`)

PNG images intended for component examples and/or UI.

### Icons (`Icons/`)

SVG icon files used by the icon system.

Because resource loading depends on how the package is integrated, always validate runtime loading in your app target.

## Notes

- `Stories/` are examples/templates for manual inspection; they are not a test suite.
- If you change resource names or add new ones, keep `IconRegistry.swift` in sync.
