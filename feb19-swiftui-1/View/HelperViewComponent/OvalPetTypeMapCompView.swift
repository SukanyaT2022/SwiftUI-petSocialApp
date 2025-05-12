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
        let name:String
        let imageName:String
        let id = UUID()
    }
    
    let petArray: [Pet] = [
        Pet(name: "cat", imageName: "img1"),
        Pet(name: "dog", imageName: "img2"),
        Pet(name: "bird", imageName: "img1"),
        Pet(name: "fish", imageName: "img2"),
        Pet(name: "lizard", imageName: "img1"),
        ]
    var rows: [GridItem] = [
        GridItem(.flexible(minimum: 50))
    ]
    @State var selectedPet: String? = nil
    
    var body: some View {
//        showsIndicators: false for remove slide var 
        ScrollView(.horizontal, showsIndicators: false){
            LazyHGrid(rows: rows, spacing: 1) {
       
                    ForEach(petArray) { pet in
                        
                        ZStack{
                            Rectangle()
                                .fill(selectedPet == pet.name ? Color(hex: AppThemeColor.orange).opacity(0.2) : Color.gray.opacity(0.5))
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .onTapGesture {
                                 
                                    if selectedPet == pet.name{
                                        selectedPet = nil
                                    }else{
                                        selectedPet = pet.name
                                    }
                                }
                        }
                        
                        OvalBoxView(petType: pet.name, petImage: pet.imageName)
                    }
                }//close lazyHgride
                .padding() // Add padding for better spacing
            
            
            }
        }
    
    struct OvalBoxView: View{
        let petType : String
        let petImage: String
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
            .background(Color(hex: AppThemeColor.veryLightGray))
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
    OvalPetTypeMapCompView()
}
