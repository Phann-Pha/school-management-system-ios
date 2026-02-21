
import SwiftUI

struct OnboardScreen: View {
    @Environment(\.presentationMode) private var backStack: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { _ in
            ZStack {
                Color(UIColor(resource: .white))
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    HeaderContentView(onBack: {
                        backStack.wrappedValue.dismiss()
                    }, onSkip: {
                        
                    })

                    Spacer()

                    
                }
            }
            
        }.navigationBarBackButtonHidden()
    }
    
    @ViewBuilder
    private func HeaderContentView(onBack: @escaping () -> Void, onSkip: @escaping () -> Void) -> some View {
        HStack(alignment: .center) {
            ButtonBack(callback: onBack)
            Spacer()
            ButtonSkip(callback: onSkip)
        }
        .padding(.horizontal, 24)
        .padding(.top, 8)
    }
    
    @ViewBuilder
    private func ButtonBack(callback: @escaping () -> Void) -> some View {
        Button(action: callback) {
            Image(systemName: "arrow.left")
                .resizable()
                .padding(10)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)

        }.buttonStyle(AnimatedButtonStyle())
    }
    
    @ViewBuilder
    private func ButtonSkip(callback: @escaping () -> Void) -> some View {
        Button(action: callback) {
            Text(LocalizedStringKey("Skip"))
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color(UIColor(resource: .black)))

        }.buttonStyle(AnimatedButtonStyle(cornerRadius: 0.0))
    }
}
