//
//  Untitled.swift
//  6037 Project
//
//  Created by Igor Kirnos on 10.03.2025.
//

import Foundation

struct StylePreference: Identifiable, Equatable {
    let id: UUID
    let title: String
    let imageName: String
    var isSelected: Bool

    static let sampleData: [StylePreference] = [
        StylePreference(id: UUID(), title: "CASUAL",   imageName: "casual",   isSelected: false),
        StylePreference(id: UUID(), title: "BOHO",     imageName: "boho",     isSelected: false),
        StylePreference(id: UUID(), title: "CLASSY",   imageName: "classy",   isSelected: false),
        StylePreference(id: UUID(), title: "LADYLIKE", imageName: "ladylike", isSelected: false),
        StylePreference(id: UUID(), title: "URBAN",    imageName: "urban",    isSelected: false),
        StylePreference(id: UUID(), title: "SPORTY",   imageName: "sporty",   isSelected: false)
    ]
}
