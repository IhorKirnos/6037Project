//
//  OnboardingFeature.swift
//  6037 Project
//
//  Created by Igor Kirnos on 06.03.2025.
//
//
import SwiftUI
import ComposableArchitecture

public struct OnboardingFeature: Reducer {
    @ObservableState
    public struct State: Equatable {
        var currentPage: Pages = .yourPersonalStylist
        var isQuizPresented: Bool = false
    }
    
    public enum Action: Equatable {
        case nextPage
        case previousPage
        case takeQuiz
        case quizDismissed
    }
    
    public enum Pages: Int, CaseIterable, Equatable {
        case yourPersonalStylist
        case curatedOutfits
        case weeklyOutfit
        
        mutating func next() {
            self = Self(rawValue: self.rawValue + 1) ?? Self.allCases.last!
        }
        
        mutating func previous() {
            self = Self(rawValue: self.rawValue - 1) ?? Self.allCases.first!
        }
    }
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .nextPage:
                state.currentPage.next()
                return .none
                
            case .previousPage:
                state.currentPage.previous()
                return .none
                
            case .takeQuiz:
                state.isQuizPresented = true
                return .none
                
            case .quizDismissed:
                state.isQuizPresented = false
                return .none
            }
        }
    }
}
