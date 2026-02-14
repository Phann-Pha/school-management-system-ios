
import SwiftUI

struct SplashView: View {
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size.height * 0.25
            ZStack {
                Color(UIColor(resource: .white)).ignoresSafeArea(edges: .all)
                VStack(alignment: .center) {
                    Spacer()

                    VStack(alignment: .center) {
                        Image("splash-screen-icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: size, height: size)
                            .padding(.bottom, 32)
                    }

                    Spacer()
                    VStack(alignment: .center) {
                        SplashButtonView(text: "Get Started")
                    }
                    .padding(.bottom, 32)
                }
            }
        }
    }
}
