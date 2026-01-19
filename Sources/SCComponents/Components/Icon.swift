import SwiftUI

public struct Icon: View {
    let name: IconName
    let size: CGFloat
    
    public init(name: IconName, size: CGFloat = 24) {
        self.name = name
        self.size = size
    }
    
    public var body: some View {
        // Option 1: Use PDF assets (recommended)
        // Convert SVG to PDF and add to Asset Catalog, then use:
        Image(name.rawValue)
            .resizable()
            .renderingMode(.template)
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
        
        // Option 2: If using SwiftSVG library, uncomment below:
        // SVGIcon(name: name.rawValue, size: size)
    }
}

// MARK: - Alternative: SVG Support with SwiftSVG
// To use SVG directly, add SwiftSVG package dependency:
// .package(url: "https://github.com/pocketsvg/PocketSVG.git", from: "2.0.0")
//
// Then create SVGIcon view:
/*
import PocketSVG

struct SVGIcon: View {
    let name: String
    let size: CGFloat
    
    var body: some View {
        if let url = Bundle.main.url(forResource: name, withExtension: "svg", subdirectory: "Icons") {
            SVGImageView(contentsOf: url)
                .frame(width: size, height: size)
        } else {
            Image(systemName: "questionmark")
                .frame(width: size, height: size)
        }
    }
}
*/
