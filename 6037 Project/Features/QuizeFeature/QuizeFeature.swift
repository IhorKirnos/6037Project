//
//  QuizeFeature.swift
//  6037 Project
//
//  Created by Igor Kirnos on 09.03.2025.
//

import ComposableArchitecture
import Foundation

struct QuizFeature: Reducer {
    struct State: Equatable {
        var quizData = QuizData()
        var quizResults: QuizData? = nil
        var currentStep: Int = 1
    }
    
    enum Action: Equatable {
        case onAppear
        case focusItemsLoaded([FocusItem])
        case toggleFocusItem(UUID)
        case continueStepOne
        
        case onAppearStepTwo
        case stylePreferencesLoaded([StylePreference])
        case toggleStylePreference(UUID)
        case continueStepTwo
        
        case onAppearStepThree
        case colorPreferencesLoaded([ColorPreference])
        case toggleColorPreference(UUID)
        case continueStepThree
        
        case goBack
        
        case choosePlan
    }
    
    @Dependency(\.quizDataClient) var quizDataClient
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
            
        case .onAppear:
            let data = quizDataClient.fetchQuizData()
            return .send(.focusItemsLoaded(data.focusItems))
            
        case let .focusItemsLoaded(items):
            state.quizData.focusItems = items
            return .none
            
        case let .toggleFocusItem(id):
            if let index = state.quizData.focusItems.firstIndex(where: { $0.id == id }) {
                state.quizData.focusItems[index].isSelected.toggle()
            }
            return .none
            
        case .continueStepOne:
            state.quizResults = QuizData(
                focusItems: state.quizData.focusItems.filter { $0.isSelected },
                stylePreferences: state.quizData.stylePreferences,
                colorPreferences: state.quizData.colorPreferences
            )
            state.currentStep = 2
            return .send(.onAppearStepTwo)
            
        case .onAppearStepTwo:
            let data = quizDataClient.fetchQuizData()
            return .send(.stylePreferencesLoaded(data.stylePreferences))
            
        case let .stylePreferencesLoaded(styles):
            state.quizData.stylePreferences = styles
            return .none
            
        case let .toggleStylePreference(id):
            if let index = state.quizData.stylePreferences.firstIndex(where: { $0.id == id }) {
                state.quizData.stylePreferences[index].isSelected.toggle()
            }
            return .none
            
        case .continueStepTwo:
            state.quizResults = QuizData(
                focusItems: state.quizData.focusItems,
                stylePreferences: state.quizData.stylePreferences.filter { $0.isSelected },
                colorPreferences: state.quizData.colorPreferences
            )
            state.currentStep = 3
            return .send(.onAppearStepThree)
            
        case .onAppearStepThree:
            let data = quizDataClient.fetchQuizData()
            return .send(.colorPreferencesLoaded(data.colorPreferences))
            
        case let .colorPreferencesLoaded(colors):
            state.quizData.colorPreferences = colors
            return .none
            
        case let .toggleColorPreference(id):
            if let index = state.quizData.colorPreferences.firstIndex(where: { $0.id == id }) {
                state.quizData.colorPreferences[index].isSelected.toggle()
            }
            return .none
            
        case .continueStepThree:
            state.quizResults = QuizData(
                focusItems: state.quizData.focusItems,
                stylePreferences: state.quizData.stylePreferences,
                colorPreferences: state.quizData.colorPreferences.filter { $0.isSelected }
            )
            
            return .send(.choosePlan)
            
        case .choosePlan:
            return .none
            
            
        case .goBack:
            if state.currentStep > 1 {
                state.currentStep -= 1
            }
            return .none
        }
    }
}

