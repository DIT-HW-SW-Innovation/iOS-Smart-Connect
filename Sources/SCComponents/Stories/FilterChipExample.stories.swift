import SwiftUI

// Xcode Previews for FilterChipExample
struct FilterChipExample_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 40) {
            FilterChipExample(theme: .light)
                .previewDisplayName("Light Mode")
            
            FilterChipExample(theme: .dark)
                .previewDisplayName("Dark Mode")
        }
        .previewLayout(.sizeThatFits)
    }
}
