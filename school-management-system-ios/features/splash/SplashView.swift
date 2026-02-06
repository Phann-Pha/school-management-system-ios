
import SwiftUI

struct SplashView: View {
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size.height * 0.3
            ZStack {
                Color(UIColor(resource: .white)).ignoresSafeArea(edges: .all)
                VStack(alignment: .center) {
                    Spacer()

                    Image("company_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size, height: size)

                    Spacer()
                    Text("1.0.0").font(.system(size: 13, weight: .none))
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    coordinator.switchTo(.main)
                }
            }
        }
    }
}
