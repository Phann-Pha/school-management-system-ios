import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader(content: { _ in
            ZStack {
                // COLOR BACKGROUND
                Color(UIColor(resource: .white))
                    .opacity(1)
                    .ignoresSafeArea(edges: .all)

                // MAIN CONTENT
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
    ContentView()
}
