import SwiftUI

import SwiftUI

struct PetCardView: View {
    let petName: String
    let distance: String
    let imageName: String
    let petType: String
    let petBreed: String
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
                
                VStack(alignment: .leading) {
                    
                    // Pet name
                    
                    Text(petName)
                        .font(.title)
                        .bold()
                    
                    
                    // Distance
                    Text(distance)
                        .foregroundColor(.gray)
                    Text(petType)
                        .foregroundColor(.gray)
                    Text(petBreed)
                        .font(.subheadline)
                    foregroundColor(.gray)
                    // type
                }
                
            }
            .padding()
            //            .zIndex(1)
            
            // Pet image
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            //            offset is posotionin zindex
                .offset(x: 100, y: 5)
        }
    }
}



struct TriangleBoxMapView: View {
    var body: some View {
        Rectangle()
            .frame(width: 180, height: 180)
            .scaleEffect(x: -1, y: 1)
            .foregroundColor(.orange) // Apply peach color
            .cornerRadius(20)
    }
}


#Preview {
    PetCardView(petName: "Tom", distance: "2km", imageName: "dog1bg", petType: "anypet", petBreed: "breed")
}
