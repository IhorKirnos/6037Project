//
//  AppView.swift
//  6037 Project
//
//  Created by Igor Kirnos on 10.03.2025.
//

import SwiftUI
import ComposableArchitecture

struct AppView: View {
    let store: StoreOf<AppFeature>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                switch viewStore.state.currentScreen {
                case .welcome:
                    WelcomeView(store: store.scope(state: \.welcome, action: \.welcome))
                case .onboarding:
                    OnboardingView(store: store.scope(state: \.onboarding, action: \.onboarding))
                case .quiz:
                    QuizView(store: store.scope(state: \.quiz, action: \.quiz))
                case .plan:
                    ChoosePlanView(store: store.scope(state: \.plan, action: \.plan))
                }
            }
            .animation(.easeInOut, value: viewStore.state.currentScreen)
        }
    }
}
