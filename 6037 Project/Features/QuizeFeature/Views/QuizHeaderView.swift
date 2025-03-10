//
//  Untitled.swift
//  6037 Project
//
//  Created by Igor Kirnos on 10.03.2025.
//

import SwiftUI

struct QuizHeaderView: View {
    let topTitle: String
    let mainTitle: String
    let subTitle: String?
    let backAction: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                if let backAction = backAction {
                    Button(action: backAction) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20))
                            .foregroundColor(.textColor)
                    }
                    .padding(.trailing, 8)
                }
                Spacer()
                Text(topTitle)
                    .multilineTextAlignment(.center)
                    .font(.poppins(.regular, size: 14))
                    .foregroundColor(.textColor)
                Spacer()
            }
            .padding(.bottom, 16)
            
            VStack(spacing: 8) {
                Group {
                    Text(mainTitle)
                        .font(.kaiseiTokumin(.medium, size: 26))
                        .foregroundColor(.textColor)
                    
                    if let subTitle = subTitle {
                        Text(subTitle)
                            .font(.poppins(.light, size: 14))
                            .foregroundColor(.textColor)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.bottom, 24)
    }
}
