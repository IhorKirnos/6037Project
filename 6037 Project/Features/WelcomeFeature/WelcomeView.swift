//
//  WelcomeView.swift
//  6037 Project
//
//  Created by Igor Kirnos on 09.03.2025.
//

import SwiftUI
import ComposableArchitecture

struct WelcomeView: View {
    let store: StoreOf<WelcomeFeature>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                backgroundImage
                gradientOverlay
                contentView
            }
        }
    }

    private var backgroundImage: some View {
        GeometryReader { geometry in
            Image("welcomeImage")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
        }
        .ignoresSafeArea()
    }

    private var gradientOverlay: some View {
        VStack {
            Spacer()
            LinearGradient(
                stops: [
                    .init(color: .clear, location: 0.3),
                    .init(color: .black, location: 0.85)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        }
        .edgesIgnoringSafeArea(.bottom)
    }

    private var contentView: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                mainTitle("Online Personal \nStyling.")
                mainTitle("Outfits for \nEvery Woman.")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.bottom, 61)
            VStack(alignment: .center, spacing: 12) {
                Button(action: {
                    store.send(.startOnboarding)
                }) {
                    Text("CONTINUE")
                        .frame(maxWidth: .infinity, maxHeight: 48)
                        .font(.poppins(.regular, size: 14))
                        .foregroundColor(.black)
                        .background(Color.white)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        
        .frame(maxHeight: .infinity, alignment: .top)
    }

    @ViewBuilder
    private func mainTitle(_ text: String) -> some View {
        Text(text)
            .font(.kaiseiTokumin(.medium, size: 32))
            .foregroundColor(.white)
    }
}

#Preview {
    let store = Store(initialState: WelcomeFeature.State()) {
        WelcomeFeature()
    }
    WelcomeView(store: store)
}
