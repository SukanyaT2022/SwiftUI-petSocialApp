//
//  RegisterPetScreenView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/4/25.
//

import SwiftUI

struct RegisterPetScreenView: View {
    var petDetailClass = PetClass()
    //    var petDetailClass:PetClass = PetClass()
    var body: some View {
        VStack{
            Image("m2")
                .frame(width:200, height: 200)
                .cornerRadius(100)
            Text("Get to Know Your Pet!")
                .font(.title)
                .padding()
            VStack{
                RoundTextFieldComp()
            }
            
        }
    }
}

#Preview {
    RegisterPetScreenView()
}
