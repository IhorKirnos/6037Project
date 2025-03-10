//
//  _037_ProjectApp.swift
//  6037 Project
//
//  Created by Igor Kirnos on 06.03.2025.
//

import SwiftUI
import ComposableArchitecture

@main
struct _6037_ProjectApp: App {
    let storeAppFlow = Store(
            initialState: AppFeature.State(),
            reducer: { AppFeature() }
        )
    var body: some Scene {
        WindowGroup {
            AppView(store: storeAppFlow)
        }
    }
}


