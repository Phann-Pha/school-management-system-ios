import SwiftUI

struct MainContentView: View {
    
    var body: some View {
        GeometryReader(content: { _ in
            ZStack {
                
                Color(UIColor(resource: .white))
                    .opacity(1)
                    .ignoresSafeArea(edges: .all)

                VStack {
                    Text("Hello, World!")
                        .font(.body)
                        .foregroundStyle(Color(UIColor(resource: .black)))
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 24)
            }
        })
    }
}

#Preview {
    MainContentView()
}
