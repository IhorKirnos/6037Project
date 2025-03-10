//
//  Font+Extensions.swift
//  6037 Project
//
//  Created by Igor Kirnos on 09.03.2025.
//

import SwiftUI

extension Font {
    static func kaiseiTokumin(_ style: KaiseiTokuminStyle, size: CGFloat) -> Font {
        return .custom(style.rawValue, size: size)
    }
    static func poppins(_ style: PoppinsStyle, size: CGFloat) -> Font {
        return .custom(style.rawValue, size: size)
    }
}

enum KaiseiTokuminStyle: String {
    case regular = "KaiseiTokumin-Regular"
    case medium = "KaiseiTokumin-Medium"
    case bold = "KaiseiTokumin-Bold"
    case extraBold = "KaiseiTokumin-ExtraBold"
}

enum PoppinsStyle: String {
    case thin = "Poppins-Thin"
    case extraLight = "Poppins-ExtraLight"
    case light = "Poppins-Light"
    case regular = "Poppins-Regular"
    case medium = "Poppins-Medium"
    case semiBold = "Poppins-SemiBold"
    case bold = "Poppins-Bold"
    case extraBold = "Poppins-ExtraBold"
    case black = "Poppins-Black"
}
