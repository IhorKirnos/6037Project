//
//  Untitled.swift
//  6037 Project
//
//  Created by Igor Kirnos on 10.03.2025.
//

import SwiftUI

struct OnboardingPageView: View {
    let image: String
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 4) {
                Text(title)
                    .multilineTextAlignment(.center)
                    .font(.kaiseiTokumin(.bold, size: 28))
                    .foregroundColor(.textColor)
                
                Text(subtitle)
                    .multilineTextAlignment(.center)
                    .font(.kaiseiTokumin(.medium, size: 20))
                    .foregroundColor(.textColor)
            }
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 20)
    }
}
