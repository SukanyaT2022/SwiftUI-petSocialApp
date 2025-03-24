//
//  PetRegister.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/20/25.
//

import SwiftUI

struct PetRegister: View {
    var petClass: PetClass = PetClass()
    var body: some View {
        
        VStack{
            AddPhotoCompView()
                .padding(.top,40)
            
            VStack(spacing: 20){
                RoundTextFieldComp(filledValue:petClass.name, placeholder: "Pet Name")
                RoundTextFieldComp(filledValue:petClass.gender, placeholder: "Pet Gender")
                RoundTextFieldComp(filledValue:petClass.type, placeholder: "Pet Type")
                RoundTextFieldComp(filledValue:petClass.breed, placeholder: "Pet Breed")
                RoundTextFieldComp(filledValue:petClass.size, placeholder: "Pet Size")
                RoundTextFieldComp(filledValue:petClass.DOB, placeholder: "Pet DOB")
                
                ButtonComp(buttonTitle: "Register") {
                  
                }
                .padding(.top,20)
                Spacer()
            }
            .padding(.top,30)
    
        }
    }
}

#Preview {
    PetRegister()
}
