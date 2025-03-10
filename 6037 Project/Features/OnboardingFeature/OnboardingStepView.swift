//
//  OnboardingStepView.swift
//  6037 Project
//
//  Created by Igor Kirnos on 06.03.2025.
//

import SwiftUI
import ComposableArchitecture


import SwiftUI
import ComposableArchitecture

struct OnboardingView: View {
    var store: StoreOf<OnboardingFeature>
    private typealias Page = OnboardingFeature.Pages
       
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                tabViewSection
                pageIndicator
                quizButton
                TermsView()
                    .padding(.bottom, 14)
            }
            .edgesIgnoringSafeArea(.top)
            .frame(maxHeight: .infinity)
        }
    }
    
    private var tabViewSection: some View {
        TabView(selection: Binding(
            get: { store.state.currentPage },
            set: { newPage in
                if newPage.rawValue > store.state.currentPage.rawValue {
                    store.send(.nextPage)
                } else if newPage.rawValue < store.state.currentPage.rawValue {
                    store.send(.previousPage)
                }
            }
        )) {
            OnboardingPageView(
                image: "onboarding1",
                title: "Your Personal Stylist",
                subtitle: "who matches you perfectly"
            )
            .tag(Page.yourPersonalStylist)
            
            OnboardingPageView(
                image: "onboarding2",
                title: "Curated Outfits",
                subtitle: "of high quality and multiple brands"
            )
            .tag(Page.curatedOutfits)
            
            OnboardingPageView(
                image: "onboarding3",
                title: "Weekly Outfit Selections",
                subtitle: "hand-picked by your stylist"
            )
            .tag(Page.weeklyOutfit)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .padding(.top, 78)
    }
    
    private var pageIndicator: some View {
        HStack(spacing: 7) {
            ForEach(Page.allCases, id: \.self) { page in
                if page == store.state.currentPage {
                    ZStack {
                        Circle()
                            .stroke(Color.black, lineWidth: 1)
                            .frame(width: 14, height: 14)
                        Circle()
                            .fill(Color.black)
                            .frame(width: 8, height: 8)
                    }
                } else {
                    Circle()
                        .fill(Color.pageIndicatorInactiveColor)
                        .frame(width: 8, height: 8)
                }
            }
        }
        .padding(.top, 10)
    }
    
    private var quizButton: some View {
        Button(action: {
            store.send(.takeQuiz)
        }) {
            Text("Take a Quiz")
                .frame(maxWidth: .infinity, maxHeight: 60)
                .font(.poppins(.semiBold, size: 16))
                .foregroundColor(.white)
                .background(Color.black)
        }
        .padding(.horizontal, 20)
        .padding(.top, 60)
        .padding(.bottom, 14)
    }
}

struct TermsView: View {
    var body: some View {
        VStack {
            Text("By tapping Get started or I already have an account,")
                .font(.footnote)
                .foregroundColor(.secondaryColor)
                .padding(.top, 10)
            
            HStack {
                Text("you agree to our")
                    .font(.footnote)
                    .foregroundColor(.secondaryColor)
                Button(action: {
                    if let url = URL(string: "https://www.example.com/terms") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Text("Terms of Use")
                        .font(.footnote)
                        .foregroundColor(.textColor)
                        .underline()
                }
                
                Text("and")
                    .font(.footnote)
                    .foregroundColor(.secondaryColor)
                
                Button(action: {
                    if let url = URL(string: "https://www.example.com/privacy") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Text("Privacy Policy")
                        .font(.footnote)
                        .foregroundColor(.textColor)
                        .underline()
                }
            }
        }
    }
}

#Preview {
    let store = Store(initialState: OnboardingFeature.State()) {
        OnboardingFeature()
    }
    OnboardingView(store: store)
}
