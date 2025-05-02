import SwiftUI

import SwiftUI

struct PetCardView: View {
    let petName: String
    let distance: String
    let imageURL: URL

    var body: some View {
        ZStack(alignment: .topLeading) {
            // Background shape with soft peach color
            TriangleBoxMapView()

            VStack(alignment: .leading, spacing: 8) {
                // Heart icon
                Image(systemName: "heart.fill")
                    .foregroundColor(.black)
                    .padding(6)
                    .background(Circle().fill(Color.white))
                    .padding(.bottom, 10)

                // Pet name
                Text(petName)
                    .font(.title)
                    .bold()

                // Distance
                Text(distance)
                    .foregroundColor(.gray)
            }
            .padding()
            .zIndex(1)

            // Pet image
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            .offset(x: 120, y: 60)
        }
    }
}



struct TriangleBoxMapView: View {
    var body: some View {
        RotatedSlantedShape()
            .frame(width: 300, height: 300)
            .scaleEffect(x: -1, y: 1)
            .foregroundColor(.orange) // Apply peach color
    }
}

// Triangle box component
struct RotatedSlantedShape: Shape {
    var cornerRadius: CGFloat = 20 // Adjust the corner radius as needed
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Modify these points to add a more steep slope
        let topLeft = CGPoint(x: rect.height * 0.1, y: 0)  // Increased slope
        let topRight = CGPoint(x: rect.height, y: 0)
        let bottomRight = CGPoint(x: rect.height, y: rect.width * 0.9)  // Increased slope
        let bottomLeft = CGPoint(x: 0, y: rect.width * 0.9)  // Increased slope
        
        path.move(to: CGPoint(x: topLeft.x + cornerRadius, y: topLeft.y)) // Start at the rounded corner
        path.addLine(to: CGPoint(x: topRight.x - cornerRadius, y: topRight.y)) // Move to the top-right with a corner radius
        path.addArc(tangent1End: topRight, tangent2End: bottomRight, radius: cornerRadius) // Add rounded corner
        path.addLine(to: CGPoint(x: bottomRight.x, y: bottomRight.y - cornerRadius)) // Move down to the bottom-right with rounded corner
        path.addArc(tangent1End: bottomRight, tangent2End: bottomLeft, radius: cornerRadius) // Bottom-right rounded corner
        path.addLine(to: CGPoint(x: bottomLeft.x + cornerRadius, y: bottomLeft.y)) // Move to the bottom-left
        path.addArc(tangent1End: bottomLeft, tangent2End: topLeft, radius: cornerRadius) // Bottom-left rounded corner
        path.addLine(to: CGPoint(x: topLeft.x, y: topLeft.y + cornerRadius)) // Top-left rounded corner
        path.closeSubpath()
        
        return path
    }
}

#Preview {

    PetCardView(petName: "Fluffykins", distance:"2km", imageURL: URL(string: "https://plus.unsplash.com/premium_photo-1666777247416-ee7a95235559?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!)
}
