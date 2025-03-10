//
//  Untitled.swift
//  6037 Project
//
//  Created by Igor Kirnos on 10.03.2025.
//

import Foundation

struct FocusItem: Equatable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    var isSelected: Bool
}

extension FocusItem {
    static let sampleData: [FocusItem] = [
        FocusItem(
            id: UUID(),
            title: "REINVENT WARDROBE",
            description: "to discover fresh outfit ideas",
            isSelected: false
        ),
        FocusItem(
            id: UUID(),
            title: "DEFINE COLOR PALETTE",
            description: "to enhance my natural features",
            isSelected: false
        ),
        FocusItem(
            id: UUID(),
            title: "CREATE A SEASONAL CAPSULE",
            description: "to curate effortless and elegant looks",
            isSelected: false
        ),
        FocusItem(
            id: UUID(),
            title: "DEFINE MY STYLE",
            description: "to discover my signature look",
            isSelected: false
        ),
        FocusItem(
            id: UUID(),
            title: "CREATE AN OUTFIT FOR AN EVENT",
            description: "to own a spotlight wherever you go",
            isSelected: false
        )
    ]
}

