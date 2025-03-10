//
//  QuizeView.swift
//  6037 Project
//
//  Created by Igor Kirnos on 09.03.2025.
//

import SwiftUI
import ComposableArchitecture

struct QuizView: View {
    let store: StoreOf<QuizFeature>
    let colorItemSize: CGFloat = 110
    let spacing: CGFloat = 12

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                ZStack {
                    switch viewStore.currentStep {
                    case 1:
                        stepOneView(viewStore: viewStore)
                    case 2:
                        stepTwoView(viewStore: viewStore)
                    case 3:
                        stepThreeView(viewStore: viewStore)
                    default:
                        EmptyView()
                    }
                }
                .animation(.easeInOut, value: viewStore.currentStep)
                
                continueButton(viewStore: viewStore)
            }
            .padding()
            .onAppear {
                loadData(for: viewStore.currentStep, viewStore: viewStore)
            }
        }
    }
    
    
    private func stepOneView(viewStore: ViewStore<QuizFeature.State, QuizFeature.Action>) -> some View {
        VStack {
            QuizHeaderView(
                topTitle: "LIFESTYLE & INTERESTS",
                mainTitle: "What’d you like our stylists to focus on?",
                subTitle: "We offer services via live-chat mode.",
                backAction: nil
            )
            
            VStack(alignment: .leading, spacing: 12) {
                ForEach(viewStore.quizData.focusItems) { item in
                    QuizRowView(item: item) {
                        viewStore.send(.toggleFocusItem(item.id))
                    }
                }
            }
            Spacer()
        }
    }
    
    private func stepTwoView(viewStore: ViewStore<QuizFeature.State, QuizFeature.Action>) -> some View {
        VStack {
            QuizHeaderView(
                topTitle: "STYLE PREFERENCES",
                mainTitle: "Which style best represents you?",
                subTitle: nil,
                backAction: { viewStore.send(.goBack) }
            )
            
            ScrollView(.vertical) {
                let columns = [
                    GridItem(.flexible(), spacing: spacing),
                    GridItem(.flexible(), spacing: spacing)
                ]
                LazyVGrid(columns: columns, spacing: spacing) {
                    ForEach(viewStore.quizData.stylePreferences) { style in
                        QuizStylePreferenceView(style: style) {
                            viewStore.send(.toggleStylePreference(style.id))
                        }
                    }
                }
                .padding(.horizontal, 8)
            }
            Spacer()
        }
    }
    
    private func stepThreeView(viewStore: ViewStore<QuizFeature.State, QuizFeature.Action>) -> some View {
        VStack {
            QuizHeaderView(
                topTitle: "STYLE PREFERENCES",
                mainTitle: "Choose favourite colors",
                subTitle: nil,
                backAction: { viewStore.send(.goBack) }
            )
            
            ScrollView(.vertical) {
                let columns = [
                    GridItem(.fixed(colorItemSize), spacing: spacing, alignment: .center),
                    GridItem(.fixed(colorItemSize), spacing: spacing, alignment: .center),
                    GridItem(.fixed(colorItemSize), spacing: spacing, alignment: .center)
                ]
                LazyVGrid(columns: columns, spacing: spacing) {
                    ForEach(viewStore.quizData.colorPreferences) { colorPref in
                        QuizColorPreferenceView(colorItemSize: colorItemSize, colorPref: colorPref) {
                            viewStore.send(.toggleColorPreference(colorPref.id))
                        }
                    }
                }
                .padding(.horizontal, 8)
            }
            Spacer()
        }
    }
    
    private func continueButton(viewStore: ViewStore<QuizFeature.State, QuizFeature.Action>) -> some View {
        Button(action: {
            switch viewStore.currentStep {
            case 1: viewStore.send(.continueStepOne)
            case 2: viewStore.send(.continueStepTwo)
            case 3: viewStore.send(.continueStepThree)
            default: break
            }
        }) {
            Text("CONTINUE")
                .font(.poppins(.regular, size: 14))
                .frame(maxWidth: .infinity, minHeight: 48)
                .foregroundColor(.white)
                .background(Color.black)
        }
    }
    
    
    private func loadData(for step: Int, viewStore: ViewStore<QuizFeature.State, QuizFeature.Action>) {
        switch step {
        case 1:
            viewStore.send(.onAppear)
        case 2:
            viewStore.send(.onAppearStepTwo)
        case 3:
            viewStore.send(.onAppearStepThree)
        default:
            break
        }
    }
}

#Preview {
    QuizView(
        store: Store(
            initialState: QuizFeature.State(),
            reducer: { QuizFeature() }
        )
    )
}
