//
//  dddfView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/24/25.
//

import SwiftUI

struct PetDetail: View {
    let petProperty = ["Breed", "Age", "Gender", "Size"]
    var petPassDataFromtHomeVar: PetBreedModal
    var body: some View {
     // pass data from homeview after user select data
        
        
            
            VStack{
//                ScrollView(.vertical, showsIndicators: false){
                SquarePhotoImageView()
                NameInfoGridBarCompView()
//                Spacer()
                List(petProperty, id: \.self){item in
                       
                    PetPropertyIndividualBoxCompView(leftTiltle: item, rightTiltle: "pet info")
                }
            }
           
         //padding for the parent
            .padding(2)
            
//        }
   
    }
}

#Preview {
//    PetDetail()
}
