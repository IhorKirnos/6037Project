//
//  ChoosePlanFeature.swift
//  6037 Project
//
//  Created by Igor Kirnos on 10.03.2025.
//

import ComposableArchitecture
import Foundation

struct ChoosePlanFeature: Reducer {
    struct State: Equatable {
        var paymentOptions: [PaymentOption] = [
            PaymentOption(
                id: UUID(),
                title: "HOT DEAL 🔥",
                subtitle: "TRY 3 DAYS FOR FREE",
                description: "then $29.99 billed monthly",
                isSelected: false,
                isHotDeal: true
            ),
            PaymentOption(
                id: UUID(),
                title: "Quarterly",
                subtitle: "$59.99",
                description: "billed quarterly",
                isSelected: false
            ),
            PaymentOption(
                id: UUID(),
                title: "Lifetime",
                subtitle: "$99.99",
                description: "one-time payment",
                isSelected: false
            )
        ]
    }
    
    enum Action: Equatable {
        case optionTapped(UUID)
        case continueTapped
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case let .optionTapped(id):
            for index in state.paymentOptions.indices {
                state.paymentOptions[index].isSelected = (state.paymentOptions[index].id == id)
            }
            return .none
            
        case .continueTapped:
            
            return .none
        }
    }
}

struct PaymentOption: Equatable, Identifiable {
    let id: UUID
    let title: String
    let subtitle: String
    let description: String
    var isSelected: Bool
    var isHotDeal: Bool = false
}
