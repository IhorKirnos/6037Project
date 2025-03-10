//
//  Untitled.swift
//  6037 Project
//
//  Created by Igor Kirnos on 10.03.2025.
//

import SwiftUI

struct QuizRowView: View {
    let item: FocusItem
    let toggleAction: () -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.poppins(.medium, size: 13))
                    .foregroundColor(.textColor)
                Text(item.description)
                    .font(.poppins(.light, size: 14))
                    .foregroundColor(.textColor)
            }
            Spacer()
            Image(systemName: item.isSelected ? "checkmark.square.fill" : "square")
                .font(.system(size: 20))
                .foregroundColor(item.isSelected ? .textColor : .inactiveGreyColor)
        }
        .frame(maxHeight: 72)
        .padding(.horizontal, 16)
        .overlay(
            Rectangle()
                .stroke(item.isSelected ? Color.textColor : Color.inactiveGreyColor, lineWidth: 1)
        )
        .contentShape(Rectangle()) 
        .onTapGesture {
            toggleAction()
        }
    }
}
