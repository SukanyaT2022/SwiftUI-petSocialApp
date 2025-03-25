//
//  dddfView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/24/25.
//

import SwiftUI

struct PetDetail: View {
    let petProperty = ["Breed", "Age", "Gender", "Size"]
    var body: some View {
        
            
            VStack{
//                ScrollView(.vertical, showsIndicators: false){
                SquarePhotoImageView()
                NameGridCompView()
//                Spacer()
                List(petProperty, id: \.self){item in
                       
                    PetPropertyIndividualBoxCompView(leftTiltle: item, rightTiltle: "")
                }
            }
           
         //padding for the parent
            .padding(2)
            
//        }
   
    }
}

#Preview {
    PetDetail()
}
