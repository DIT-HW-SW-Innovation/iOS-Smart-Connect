import SwiftUI

@main
public struct SCComponentsApp: App {
    public init() {}
    
    public var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var theme: FilterChipTheme = .light
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Picker("Theme", selection: $theme) {
                    Text("Light").tag(FilterChipTheme.light)
                    Text("Dark").tag(FilterChipTheme.dark)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                FilterChipExample(theme: theme)
                
                Spacer()
            }
            .navigationTitle("SC Components")
        }
    }
}
