//
//  PetPropertyIndividualBoxView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/25/25.
//

import SwiftUI

struct PetPropertyIndividualBoxCompView: View {
    let leftTiltle: String
    let rightTiltle: String
    var body: some View {
        HStack{
            Image(systemName: "dog")
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(leftTiltle)
                .font(Font.system(size: 25))
                .fontWeight(.semibold)
                .padding(.leading,10)
            Spacer()
            Text(rightTiltle)
                .font(Font.system(size: 25))
                .fontWeight(.semibold)
            
        }
      
        .padding(.vertical,20)
        .background(Color.green.opacity(0.2))
    }
}
#Preview {
    PetPropertyIndividualBoxCompView(leftTiltle: "Left", rightTiltle: "Right")
}
