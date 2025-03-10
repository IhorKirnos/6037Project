//
//  Untitled.swift
//  6037 Project
//
//  Created by Igor Kirnos on 10.03.2025.
//

import SwiftUI

struct QuizColorPreferenceView: View {
    let colorItemSize: CGFloat
    let colorPref: ColorPreference
    let toggleAction: () -> Void
   
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 8) {
                Rectangle()
                    .fill(Color(hex: colorPref.colorHex) ?? .gray)
                    .frame(width: 32, height: 32)
                
                Text(colorPref.title)
                    .font(.poppins(colorPref.isSelected ? .medium : .light, size: 13))
                    .foregroundColor(.textColor)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
            .padding()
            .background(Color.white)
            .overlay(
                Rectangle()
                    .stroke(colorPref.isSelected ? Color.textColor : Color.inactiveGreyColor, lineWidth: 1)
            )
            .onTapGesture {
                toggleAction()
            }
            
            Image(systemName: colorPref.isSelected  ? "checkmark.square.fill" : "square")
                .font(.system(size: 20))
                .foregroundColor(colorPref.isSelected  ? .textColor : .inactiveGreyColor)
                .padding(8)
        }
    }
}
