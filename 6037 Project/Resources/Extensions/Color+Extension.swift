//
//  Color+Extension.swift
//  6037 Project
//
//  Created by Igor Kirnos on 09.03.2025.
//

import SwiftUI

extension Color {
    static var textColor: Color {
        return Color("textColor")
    }
    static var secondaryColor: Color {
        return Color("secondaryText")
    }
    static var pageIndicatorInactiveColor: Color {
        return Color("pageIndicatorInactiveColor")
    }
    static var inactiveGreyColor: Color {
        return Color("inactiveGreyColor")
    }
    
    
}

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        let red   = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue  = Double(hex & 0xFF) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}

extension Color {
    init?(hex: String, alpha: Double = 1.0) {
        var hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hex.hasPrefix("#") {
            hex.removeFirst()
        }
        
        guard hex.count == 6, let rgbValue = UInt64(hex, radix: 16) else {
            return nil
        }
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}
