import SwiftUI
import ComposableArchitecture

struct ChoosePlanView: View {
    let store: StoreOf<ChoosePlanFeature>
    
    var body: some View {
        WithViewStore(store, observe: \.paymentOptions) { viewStore in
                VStack(spacing: 20) {
                    Image("stylist")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea(edges: .top)
                    
                        
                    VStack(spacing: 4) {
                        Image("stars")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 16)
                        Text("FIRST MEETING WITH A STYLIST")
                            .font(.poppins(.regular, size: 16))
                            .foregroundColor(.textColor)
                        
                        Text("Tessa caught my style with the first outfit she put together. Although we changed a few things she was great at finding what works for me!")
                            .font(.poppins(.regular, size: 12))
                            .foregroundColor(.secondaryText)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 28)
                    .padding(.bottom, 22)
                    HStack(alignment: .bottom,spacing: 12) {
                        ForEach(viewStore.state) { option in
                            VStack {
                                PaymentOptionView(
                                    option: option,
                                    action: {
                                        viewStore.send(.optionTapped(option.id))
                                    }
                                )
                            }
                        }
                    }.padding(.horizontal, 20)
                    
                    VStack(spacing: 20) {
                     
                        
                        Text("Auto-renewable. Cancel anytime.")
                            .font(.poppins(.light, size: 14))
                            .foregroundColor(.secondaryText)
                       
                        Button(action: {
                            viewStore.send(.continueTapped)
                        }) {
                            Text("CONTINUE")
                                .font(.poppins(.regular, size: 14))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: 48)
                                .background(Color.black)
                        }
                        .padding(.horizontal, 24)
                        
                        HStack(spacing: 8) {
                            Button(action: {
                            }) {
                                Text("Terms of Use")
                                    .underline()
                                    .foregroundColor(.secondaryText)
                                    .font(.poppins(.light, size: 14))
                            }
                            Text("|")
                                .foregroundColor(.secondary)
                                .font(.poppins(.light, size: 14))
                            Button(action: {
                            }) {
                                Text("Privacy Policy")
                                    .underline()
                                    .foregroundColor(.secondaryText)
                                    .font(.poppins(.light, size: 14))
                            }
                        }
                    }
                    .padding(.bottom, 50)
                }
                .background(.white)

        }
    }
}

struct PaymentOptionView: View {
    let option: PaymentOption
    let action: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            if option.isHotDeal {
                HotDealHeader(title: option.title)
            }
            PaymentOptionContent(option: option, action: action)
        }
    }
}

private struct HotDealHeader: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.poppins(.semiBold, size: 10))
            .frame(maxWidth: .infinity, minHeight: 23)
            .foregroundColor(.white)
            .padding(.vertical, 2)
            .padding(.horizontal, 6)
            .background(Color.black)
    }
}

private struct PaymentOptionContent: View {
    let option: PaymentOption
    let action: () -> Void

    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            if option.isHotDeal {
                VStack(spacing: 4) {
                    Text("TRY 3 DAYS")
                        .font(.custom("Poppins-Light", size: 16))
                        .foregroundColor(.textColor)
                    
                    Text("FOR FREE")
                        .font(.custom("Poppins-Semibold", size: 18))
                        .foregroundColor(.textColor)
                }
            } else {
                Text(option.title)
                    .font(.poppins(.medium, size: 16))
                    .foregroundColor(.textColor)
            }

            if !option.isHotDeal {
                Text(option.subtitle)
                    .font(.poppins(.light, size: 12))
                    .foregroundColor(.textColor)
            }
            
            Text(option.description)
                .font(.poppins(.light, size: 12))
                .foregroundColor(.textColor)
                .padding(.vertical, 12)
        }
        .frame(maxWidth: .infinity, maxHeight: 134, alignment: .top)
        .padding(8)
        .background(Color.white)
        .overlay(
            Rectangle()
                .stroke(option.isSelected ? Color.black : Color.gray.opacity(0.2),
                        lineWidth: option.isSelected ? 2 : 1)
        )
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    ChoosePlanView(
        store: Store(
            initialState: ChoosePlanFeature.State(),
            reducer: { ChoosePlanFeature() }
        )
    )
}
