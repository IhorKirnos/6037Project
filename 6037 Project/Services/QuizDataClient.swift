//
//  Untitled.swift
//  6037 Project
//
//  Created by Igor Kirnos on 10.03.2025.
//

import Foundation
import ComposableArchitecture

struct QuizDataClient {
    var fetchQuizData: () -> QuizData
}

extension DependencyValues {
    var quizDataClient: QuizDataClient {
        get { self[QuizDataClientKey.self] }
        set { self[QuizDataClientKey.self] = newValue }
    }
}

private struct QuizDataClientKey: DependencyKey {
    static let liveValue = QuizDataClient(
        fetchQuizData: {
            QuizData(
                focusItems: FocusItem.sampleData,
                stylePreferences: StylePreference.sampleData,
                colorPreferences: ColorPreference.sampleData
            )
        }
    )
}
