//
//  OvalPetTypeMapCompView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 4/29/25.
//

import SwiftUI

struct OvalPetTypeMapCompView: View {
//    let petArray:[String] = ["cat","dog","bird","fish","lizard"]
    
    struct Pet: Identifiable{
        let name: PetCatergory
        let imageName:String
        let id = UUID()
    }
    
    let petArray: [Pet] = [
        Pet(name: .cat, imageName: "img1"),
        Pet(name: .bird, imageName: "img2"),
        Pet(name: .dog, imageName: "img1"),
        Pet(name: .fish, imageName: "img2"),
      
        ]
    var rows: [GridItem] = [
        GridItem(.flexible(minimum: 50))
    ]
    @Binding var selectedPet: PetCatergory
    
    var body: some View {
//        showsIndicators: false for remove slide var 
        ScrollView(.horizontal, showsIndicators: false){
            LazyHGrid(rows: rows, spacing: 1) {
       
                    ForEach(petArray) { pet in
                        
                        ZStack{
                            Rectangle()
                             
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                               
                            OvalBoxView(petType: pet.name.rawValue, petImage: pet.imageName, isSelected:  selectedPet.rawValue == pet.name.rawValue)
                        }// close zstack
                        
                        .onTapGesture {
                            withAnimation{
                                selectedPet = pet.name
                            }
                        }// close
              
                }//close lazyHgride
                    .padding(.horizontal,4)
                // Add padding for better spacing
    
            
            }
        }
        }
    
    struct OvalBoxView: View{
        let petType : String
        let petImage: String
        let isSelected: Bool
        var body: some View {
            VStack(spacing: 20){
                Image(petImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                Text(petType)
            }
            .frame(width: 110, height: 160)
            .background(Color(hex:isSelected ? AppThemeColor.orange : AppThemeColor.veryLightGray))
            .clipShape(RoundedRectangle(cornerRadius: 85)) // Half of width/height for fully rounded
            .overlay(
                RoundedRectangle(cornerRadius: 85)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.trailing,15)
            
        }
    }
}
#Preview {
    OvalPetTypeMapCompView(selectedPet: .constant(.cat))
}
