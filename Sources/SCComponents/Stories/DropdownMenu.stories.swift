import SwiftUI

// Xcode Previews for DropdownMenu
struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Variant - Light")
                    .font(.headline)
                DropdownMenu(
                    buttonText: "Click me",
                    theme: .light,
                    variant: .windows
                )
            }
            .padding()
            .background(Color(red: 0.961, green: 0.965, blue: 0.984))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Variant - Dark")
                    .font(.headline)
                    .foregroundColor(.white)
                DropdownMenu(
                    buttonText: "Click me",
                    theme: .dark,
                    variant: .windows
                )
            }
            .padding()
            .background(Color(red: 0.059, green: 0.067, blue: 0.086))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Android - Light")
                    .font(.headline)
                DropdownMenu(
                    buttonText: "Click me",
                    theme: .light,
                    variant: .android
                )
            }
            .padding()
            .background(Color(red: 0.961, green: 0.965, blue: 0.984))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("iOS - Light")
                    .font(.headline)
                DropdownMenu(
                    buttonText: "Click me",
                    theme: .light,
                    variant: .iOS
                )
            }
            .padding()
            .background(Color(red: 0.961, green: 0.965, blue: 0.984))
        }
        .previewLayout(.sizeThatFits)
    }
}
