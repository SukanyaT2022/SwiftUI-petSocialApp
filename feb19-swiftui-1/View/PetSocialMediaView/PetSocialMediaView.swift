//
//  PetImageSocialView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 4/1/25.
//

import SwiftUI

struct PetSocialMediaView: View {
   
    let petImageArr = ["img1", "img2", "imgCat3", "imgCat4", "imgBird5", "imgBird6"]
    var columns: [GridItem] = [
            GridItem(.fixed(180)),
            GridItem(.fixed(180)),
         
        ]
    var body: some View {
        
        VStack{
            SquarePhotoImageView()
                .padding(.top, 40)
            NameInfoGridBarCompView()
            ScrollView {
                LazyVGrid(columns: self.columns) {
                    ForEach(petImageArr, id: \.self) { imageName in
                        Image("\(imageName)")
                            .frame(width: 160, height: 160)
                            .background(Color.orange)
                            .foregroundColor(Color.black)
                            .cornerRadius(10)
                            .aspectRatio(contentMode: .fit)
                          
                            .padding(16)
                            
                    }
                    
                }
               
//                .background(Color.yellow)
            
            }
//            above scrollview closing }
            .padding(8)
        }
            
       
        
    }
}

#Preview {
    PetSocialMediaView()
}
