//
//  Untitled.swift
//  6037 Project
//
//  Created by Igor Kirnos on 10.03.2025.
//

import Foundation

struct ColorPreference: Equatable, Identifiable {
    let id: UUID
    let title: String
    let colorHex: String
    var isSelected: Bool
    
    static let sampleData: [ColorPreference] = [
        ColorPreference(id: UUID(), title: "LIGHT BLUE",  colorHex: "#ADD8E6", isSelected: false),
        ColorPreference(id: UUID(), title: "BLUE",        colorHex: "#0000FF", isSelected: false),
        ColorPreference(id: UUID(), title: "INDIGO",      colorHex: "#4B0082", isSelected: false),
        ColorPreference(id: UUID(), title: "TURQUOISE",   colorHex: "#40E0D0", isSelected: false),
        ColorPreference(id: UUID(), title: "MINT",        colorHex: "#98FF98", isSelected: false),
        ColorPreference(id: UUID(), title: "OLIVE",       colorHex: "#808000", isSelected: false),
        ColorPreference(id: UUID(), title: "GREEN",       colorHex: "#008000", isSelected: false),
        ColorPreference(id: UUID(), title: "EMERALD",     colorHex: "#50C878", isSelected: false),
        ColorPreference(id: UUID(), title: "YELLOW",      colorHex: "#FFFF00", isSelected: false),
        ColorPreference(id: UUID(), title: "BEIGE",       colorHex: "#F5F5DC", isSelected: false),
        ColorPreference(id: UUID(), title: "ORANGE",      colorHex: "#FFA500", isSelected: false),
        ColorPreference(id: UUID(), title: "BROWN",       colorHex: "#A52A2A", isSelected: false),
        ColorPreference(id: UUID(), title: "PINK",        colorHex: "#FFC0CB", isSelected: false),
        ColorPreference(id: UUID(), title: "MAGENTA",     colorHex: "#FF00FF", isSelected: false),
        ColorPreference(id: UUID(), title: "RED",         colorHex: "#FF0000", isSelected: false)
    ]
}
