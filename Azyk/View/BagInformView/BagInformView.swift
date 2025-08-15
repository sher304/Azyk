
import SwiftUI


struct BagInformView: View {
    var body: some View {
        VStack(spacing: 20) {
            // MARK: General title
            Text("What you need to know")
                .bold()
                .font(.title)
            
            // MARK: Detailed description
            VStack(spacing: 15) {
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: "takeoutbag.and.cup.and.straw")
                        .foregroundStyle(.black)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Your bag is surprice")
                            .bold()

                        Text("""
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                        """)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            // MARK: Bottom Buttons
            VStack {
                Button(action: {
                    // Reserve logic
                }) {
                    Text("Ok")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(23)
                }
                
                Button(action: {
                    // Reserve logic
                }) {
                    Text("Cancel")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    BagInformView()
}
