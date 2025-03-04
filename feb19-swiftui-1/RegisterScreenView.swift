//
//  SecondScreenView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 2/20/25.
//

import SwiftUI

struct RegisterScreenView: View {
    var userDetailClass:UserClass = UserClass()

    var body: some View {
        VStack{
            Image("m1")
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(100)
                .padding(.top,80)
            Text("Sign up to Join Pet Social!")
                .font(.title)
                .padding()
            VStack{
                
//                RoundTextFieldComp(filledValue:petDetailClass.name)
                RoundTextFieldComp(filledValue:userDetailClass.name, placeholder: "Name")
                    
                RoundTextFieldComp(filledValue:userDetailClass.username, placeholder: "Username")
                RoundTextFieldComp(filledValue:userDetailClass.password, placeholder: "Password")
                RoundTextFieldComp(filledValue:userDetailClass.password, placeholder: "Email")
                
            }
          
        }
        Spacer()
       
    }
}

#Preview {
    RegisterScreenView()
}
