# Icon Setup Guide for SwiftUI

## The Problem

SwiftUI **does not natively support SVG files** like web browsers do. You need to convert your SVG icons to a format that iOS/macOS supports.

## Solution Options

### ✅ Option 1: Convert SVG to PDF (Recommended)

**Best for**: Vector graphics that need to scale perfectly

**Steps**:
1. Open each SVG file in a vector editor (Illustrator, Inkscape, or online tool)
2. Export/Save as PDF
3. In Xcode:
   - Open your project
   - Right-click on `Sources/SCComponents/Assets/` (or create an Asset Catalog)
   - Select "New Image Set"
   - Name it the same as your icon (e.g., "audio", "menu", etc.)
   - Drag the PDF file into the image set
   - Set "Render As" to "Template Image" (for color customization)
4. The Icon component will automatically use these PDF assets

**Advantages**:
- ✅ Vector format (scales perfectly)
- ✅ Native iOS/macOS support
- ✅ No additional dependencies
- ✅ Works with `.renderingMode(.template)` for color changes

**Tools to convert**:
- Online: https://cloudconvert.com/svg-to-pdf
- Desktop: Inkscape (free), Adobe Illustrator
- Command line: `inkscape input.svg --export-filename=output.pdf`

---

### Option 2: Use SwiftSVG Library

**Best for**: Want to keep SVG files as-is

**Steps**:
1. Add SwiftSVG dependency to `Package.swift`:
   ```swift
   dependencies: [
       .package(url: "https://github.com/pocketsvg/PocketSVG.git", from: "2.0.0")
   ]
   ```
2. Update Icon.swift to use SVG rendering
3. Keep SVG files in the Icons folder

**Advantages**:
- ✅ Keep original SVG files
- ✅ No conversion needed

**Disadvantages**:
- ❌ Requires external dependency
- ❌ Slightly more complex setup

---

### Option 3: Convert to PNG (Not Recommended)

**Best for**: Simple icons that don't need scaling

**Steps**:
1. Export SVG at @1x, @2x, @3x resolutions
2. Add to Asset Catalog as image sets
3. Use as regular images

**Disadvantages**:
- ❌ Not vector (pixelated when scaled)
- ❌ Need multiple resolutions
- ❌ Larger file sizes

---

## Recommended Approach

**Use Option 1 (PDF conversion)** because:
- Native iOS/macOS support
- Vector quality
- No dependencies
- Works with template rendering for colors

## Quick Conversion Script

If you have Node.js installed, you can use this script to batch convert:

```javascript
// convert-svg-to-pdf.js
const fs = require('fs');
const path = require('path');

// This would require a library like svg2pdf
// Or use an online service/Inkscape command line
```

Or use Inkscape command line (if installed):
```bash
for file in *.svg; do
    inkscape "$file" --export-filename="${file%.svg}.pdf"
done
```

## Current Icon Component

The current `Icon.swift` is set up to use **PDF assets from the Asset Catalog**. 

To make it work:
1. Convert all SVG files to PDF
2. Add PDFs to Xcode Asset Catalog
3. Name them exactly as the IconName enum cases (e.g., "audio", "menu", etc.)

## Testing

After adding PDF assets:
1. Open Xcode
2. Build the project
3. Icons should render correctly
4. Colors will adapt to `.foregroundColor()` modifiers
