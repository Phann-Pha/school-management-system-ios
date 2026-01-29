import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader(content: { proxy in
            ZStack {
                
                // COLOR BACKGROUND
                Color.black
                .opacity(1)
                .ignoresSafeArea(edges: .all)
                
                // MAIN CONTENT
                VStack {
                    Text("Hello, World!")
                        .font(.body)
                        .foregroundStyle(.white)
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
