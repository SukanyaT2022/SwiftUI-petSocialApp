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
        NavigationStack{
            
           
            VStack(alignment: .center){
             
            Image("m1")
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(100)
                .padding(.top,80)
            Text("Sign up to Join Pet Social!")
                .font(.title)
                .padding()
            VStack (spacing: 20){
                
//                RoundTextFieldComp(filledValue:petDetailClass.name)
                RoundTextFieldComp(filledValue:userDetailClass.name, placeholder: "Name")
                    
                RoundTextFieldComp(filledValue:userDetailClass.username, placeholder: "Username")
                RoundTextFieldComp(filledValue:userDetailClass.password, placeholder: "Password")
                RoundTextFieldComp(filledValue:userDetailClass.password, placeholder: "Email")
                ButtonComp(buttonTitle: "Sign Up", handler: {
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let window = windowScene.windows.first{
                        window.rootViewController = UIHostingController(rootView: HomeView(
                          )
                        )
                        window.makeKeyAndVisible()
                      
                    }
                
                }

              )
                //                closing end of button component and connect screen if
            }
                Spacer()
        }
            //end main v stack
        }
  
          
    }
}

#Preview {
    RegisterScreenView()
}
