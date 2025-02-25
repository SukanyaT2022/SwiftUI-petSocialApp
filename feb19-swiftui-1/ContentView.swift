//
//  ContentView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 2/19/25.
//

import SwiftUI

struct ContentView: View {
    @State var usernameVar:String = ""
    @State var passwordVar:String = ""
    @State var showAlert:Bool = false
    @State var alertMessage:String = ""
    var body: some View {
    //connect green below line
        NavigationStack{
        
            VStack (alignment:.center ){
            
            Image(systemName: "dog")
                .imageScale(.large)
                .foregroundStyle(.blue)
            Text("Welcome to pet social!")
            VStack{
                
                RoundTextFieldComp(filledValue: usernameVar, placeholder: "UserName")
                RoundTextFieldComp(filledValue: passwordVar, placeholder: "Password")
                
                //button connect to next screen
                NavigationLink {
                    if (showAlert == false){
                        SecondScreenView()
                    }

                    
                } label: {
                    ButtonComp( handler : {
                        if(usernameVar.isEmpty && passwordVar.isEmpty){
                            showAlert = true
                            alertMessage = "Foget username and password!"
                        }
                        else if(usernameVar.isEmpty){
                            showAlert = true
                            alertMessage = "Forget Username!"
                            
                        }else if(passwordVar.isEmpty){
                            showAlert = true
                            alertMessage = "Forget Password!"
                        }
                    })
                    .alert("Important Message", isPresented: $showAlert) {
                        Button("Cancel", role: .cancel) { }
                        Button("OK") {
                            // Handle OK action here
                        }
                    } message: {
                        Text(alertMessage)
                    }
                }
            }
              Spacer()//take space from the bottom and  all element move up
            }.padding(.top,200)
            
        //below cloding } from navigation
        }
       
    }
}

#Preview {
    ContentView()
}
