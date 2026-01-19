import SwiftUI

public struct FilterChipExample: View {
    @State private var allDevicesSelected = false
    @State private var selectedPngChips: [Bool] = [false, false, false]
    @State private var allFilesSelected = false
    @State private var selectedSvgChips: [Bool] = [false, false, false, false, false, false]
    
    @State private var allDevicesStage: FilterChipStage = .enabled
    @State private var pngChipStages: [FilterChipStage] = [.enabled, .enabled, .enabled]
    @State private var allFilesStage: FilterChipStage = .enabled
    @State private var svgChipStages: [FilterChipStage] = [.enabled, .enabled, .enabled, .enabled, .enabled, .enabled]
    
    let theme: FilterChipTheme
    
    public init(theme: FilterChipTheme = .light) {
        self.theme = theme
    }
    
    private let chips = ChipsData()
    
    struct ChipsData {
        let row1 = Row1()
        let row2 = Row2()
        
        struct Row1 {
            let textOnly = ChipData(text: "All devices")
            let pngText = [
                ChipData(text: "Lenovo Thinkpad", imageSrc: "lenovo_thinkpad"),
                ChipData(text: "motorola edge 60 pro", imageSrc: "moto_edge_60_pro"),
                ChipData(text: "Lenovo Tab P12", imageSrc: "lenovo_tabp12")
            ]
        }
        
        struct Row2 {
            let textOnly = ChipData(text: "All files")
            let svgText = [
                ChipData(text: "Recent", iconName: .recent),
                ChipData(text: "Images", iconName: .images),
                ChipData(text: "Videos", iconName: .videos),
                ChipData(text: "Documents", iconName: .documents),
                ChipData(text: "Audio", iconName: .audio),
                ChipData(text: "Downloads", iconName: .downloads)
            ]
        }
    }
    
    struct ChipData {
        let text: String
        var imageSrc: String? = nil
        var iconName: IconName? = nil
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // First row: 1 text-only + 3 png-text
            HStack(spacing: 8) {
                FilterChip(
                    text: chips.row1.textOnly.text,
                    variant: .textOnly,
                    stage: Binding(
                        get: { allDevicesStage },
                        set: { allDevicesStage = $0 }
                    ),
                    theme: theme,
                    onTap: handleAllDevicesClick
                )
                
                ForEach(0..<chips.row1.pngText.count, id: \.self) { index in
                    FilterChip(
                        text: chips.row1.pngText[index].text,
                        variant: .pngText,
                        stage: Binding(
                            get: { pngChipStages[index] },
                            set: { pngChipStages[index] = $0 }
                        ),
                        theme: theme,
                        imageSrc: chips.row1.pngText[index].imageSrc,
                        onTap: { handlePngChipClick(index: index) }
                    )
                }
            }
            
            // Second row: 1 text-only + 6 svg-text
            HStack(spacing: 8) {
                FilterChip(
                    text: chips.row2.textOnly.text,
                    variant: .textOnly,
                    stage: Binding(
                        get: { allFilesStage },
                        set: { allFilesStage = $0 }
                    ),
                    theme: theme,
                    onTap: handleAllFilesClick
                )
                
                ForEach(0..<chips.row2.svgText.count, id: \.self) { index in
                    FilterChip(
                        text: chips.row2.svgText[index].text,
                        variant: .svgText,
                        stage: Binding(
                            get: { svgChipStages[index] },
                            set: { svgChipStages[index] = $0 }
                        ),
                        theme: theme,
                        iconName: chips.row2.svgText[index].iconName,
                        onTap: { handleSvgChipClick(index: index) }
                    )
                }
            }
        }
        .padding(60)
        .frame(minWidth: 800, minHeight: 200)
        .background(theme == .dark ? Color(red: 0.059, green: 0.067, blue: 0.086) : Color(red: 0.961, green: 0.965, blue: 0.984))
    }
    
    private func handleAllDevicesClick() {
        if allDevicesStage == .selected {
            allDevicesStage = .enabled
            allDevicesSelected = false
        } else {
            allDevicesStage = .selected
            allDevicesSelected = true
            pngChipStages = [.enabled, .enabled, .enabled]
            selectedPngChips = [false, false, false]
        }
    }
    
    private func handlePngChipClick(index: Int) {
        if pngChipStages[index] == .selected {
            pngChipStages[index] = .enabled
            selectedPngChips[index] = false
        } else {
            pngChipStages[index] = .selected
            selectedPngChips[index] = true
            allDevicesStage = .enabled
            allDevicesSelected = false
        }
    }
    
    private func handleAllFilesClick() {
        if allFilesStage == .selected {
            allFilesStage = .enabled
            allFilesSelected = false
        } else {
            allFilesStage = .selected
            allFilesSelected = true
            svgChipStages = [.enabled, .enabled, .enabled, .enabled, .enabled, .enabled]
            selectedSvgChips = [false, false, false, false, false, false]
        }
    }
    
    private func handleSvgChipClick(index: Int) {
        if svgChipStages[index] == .selected {
            svgChipStages[index] = .enabled
            selectedSvgChips[index] = false
        } else {
            svgChipStages[index] = .selected
            selectedSvgChips[index] = true
            allFilesStage = .enabled
            allFilesSelected = false
        }
    }
}
