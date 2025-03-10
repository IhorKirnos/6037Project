//
//  WElcomeReducer.swift
//  6037 Project
//
//  Created by Igor Kirnos on 09.03.2025.
//

import SwiftUI
import ComposableArchitecture


@Reducer
struct WelcomeFeature {
    struct State: Equatable {}

    enum Action {
        case startOnboarding
    }

    var body: some ReducerOf<Self> {
        Reduce { _, action in
            switch action {
            case .startOnboarding:
                return .none
            }
        }
    }
}

