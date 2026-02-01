
import SwiftUI

struct SplashView: View {
    @State private var scale = 0.5
    @State private var opacity = 0.0
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size.height * 0.3
            ZStack {
                Color(UIColor(resource: .white)).ignoresSafeArea(edges: .all)
                VStack(alignment: .center) {
                    Spacer()

                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size, height: size)
                        .scaleEffect(scale)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.2)) {
                                self.scale = 1.0
                                self.opacity = 1.0
                            }
                        }

                    Spacer()
                    Text("1.0.0").font(.system(size: 13, weight: .none))
                        .scaleEffect(scale)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.2)) {
                                self.scale = 1.0
                                self.opacity = 1.0
                            }
                        }
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
