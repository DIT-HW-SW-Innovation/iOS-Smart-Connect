import SwiftUI

// Xcode Previews for FilterChip
struct FilterChip_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            // PNG Text - Light
            VStack(alignment: .leading, spacing: 10) {
                Text("PNG Text - Light")
                    .font(.headline)
                HStack(spacing: 10) {
                    FilterChip(
                        text: "Changeable Text",
                        variant: .pngText,
                        stage: .enabled,
                        theme: .light,
                        imageSrc: "lenovo_tabp12"
                    )
                    FilterChip(
                        text: "Changeable Text",
                        variant: .pngText,
                        stage: .hovered,
                        theme: .light,
                        imageSrc: "lenovo_tabp12"
                    )
                    FilterChip(
                        text: "Changeable Text",
                        variant: .pngText,
                        stage: .selected,
                        theme: .light,
                        imageSrc: "lenovo_tabp12"
                    )
                }
            }
            .padding()
            .background(Color(red: 0.961, green: 0.965, blue: 0.984))
            
            // PNG Text - Dark
            VStack(alignment: .leading, spacing: 10) {
                Text("PNG Text - Dark")
                    .font(.headline)
                    .foregroundColor(.white)
                HStack(spacing: 10) {
                    FilterChip(
                        text: "Changeable Text",
                        variant: .pngText,
                        stage: .enabled,
                        theme: .dark,
                        imageSrc: "lenovo_tabp12"
                    )
                    FilterChip(
                        text: "Changeable Text",
                        variant: .pngText,
                        stage: .hovered,
                        theme: .dark,
                        imageSrc: "lenovo_tabp12"
                    )
                    FilterChip(
                        text: "Changeable Text",
                        variant: .pngText,
                        stage: .selected,
                        theme: .dark,
                        imageSrc: "lenovo_tabp12"
                    )
                }
            }
            .padding()
            .background(Color(red: 0.059, green: 0.067, blue: 0.086))
        }
        .previewLayout(.sizeThatFits)
    }
}
