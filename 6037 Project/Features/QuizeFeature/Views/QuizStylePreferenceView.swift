//
//  Untitled.swift
//  6037 Project
//
//  Created by Igor Kirnos on 10.03.2025.
//

import SwiftUI

struct QuizStylePreferenceView: View {
    let style: StylePreference
    let toggleAction: () -> Void

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Image(style.imageName)
                    .resizable()
                    .scaledToFit()
                
                Text(style.title)
                    .font(.poppins(style.isSelected ? .medium : .light, size: 14))
                    .foregroundColor(.textColor)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                Rectangle()
                    .stroke(style.isSelected ? Color.textColor : Color.inactiveGreyColor, lineWidth: 1)
            )
            .onTapGesture { toggleAction() }
            
            Image(systemName: style.isSelected ? "checkmark.square.fill" : "square")
                .font(.system(size: 20))
                .foregroundColor(style.isSelected ? .textColor : .inactiveGreyColor)
                .padding(8)
        }
    }
}
