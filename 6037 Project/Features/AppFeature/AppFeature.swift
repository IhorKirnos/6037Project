//
//  AppFeature.swift
//  6037 Project
//
//  Created by Igor Kirnos on 10.03.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct AppFeature {
    struct State: Equatable {
        var currentScreen: Screen = UserDefaults.standard.bool(forKey: "hasCompletedOnboarding") ? .quiz : .welcome
        
        var welcome = WelcomeFeature.State()
        var onboarding = OnboardingFeature.State()
        var quiz = QuizFeature.State()
        var plan = ChoosePlanFeature.State()
        
        enum Screen: Equatable {
            case welcome
            case onboarding
            case quiz
            case plan
        }
    }
    
    enum Action {
        case welcome(WelcomeFeature.Action)
        case onboarding(OnboardingFeature.Action)
        case quiz(QuizFeature.Action)
        case plan(ChoosePlanFeature.Action)
    }
    
    
    var body: some ReducerOf<Self> {
        Scope(state: \.welcome, action: \.welcome) {
            WelcomeFeature()
        }

        Scope(state: \.onboarding, action: \.onboarding) {
            OnboardingFeature()
        }
        
        Scope(state: \.quiz, action: \.quiz) {
            QuizFeature()
        }
        
        Scope(state: \.plan, action: \.plan) {
            ChoosePlanFeature()
        }
        
     
        Reduce { state, action in
            switch action {
            case .welcome(.startOnboarding):
                state.currentScreen = .onboarding
                return .none
            case .onboarding(.takeQuiz):
                UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
                state.currentScreen = .quiz
                return .none
            case .quiz(.choosePlan):
                state.currentScreen = .plan
                return .none
            default:
                return .none
            }
        }
    }
}
