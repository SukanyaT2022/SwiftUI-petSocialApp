//
//  ContentView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 2/19/25.
//

import SwiftUI
import FirebaseAuth // FirebaseAuth is a third party sdk of firebase

struct LoginView: View {
    @State var usernameVar:String = ""
    @State var passwordVar:String = ""
    @State var showAlert:Bool = false
    @State var alertMessage:String = ""
    
    func singup(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Sign-up error: \(error.localizedDescription)")
            } else {
                self.navigateToHomeView()
                print("User signin: \(result?.user.uid ?? "")")
            }
        }
    }
    var body: some View {
    //connect green below line
        NavigationStack{
        
            VStack (alignment:.center, spacing: 20){
                
                //top header view
                Image(systemName: "dog")
                    .resizable()
                    .frame(width: 100, height: 80)
                    .imageScale(.large)
                    .foregroundStyle(.blue)
                
            Text("Welcome to pet social!")
                    .padding(.bottom,15)
                    .font(.custom("SourGummy-Medium", size: 24))

                VStack(spacing:20){
                    RoundTextFieldComp(filledValue: usernameVar, placeholder: "UserName")
                    RoundTextFieldComp(filledValue: passwordVar, placeholder: "Password")
                    
                }
                //close v stack
                
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
                
                    self.singup(email: "hello@yopmail.com", password: "987654")
                   

                })
                Text("No Account? Please register")
                    .onTapGesture {
                        navigateToRegisterScreen()
                    }
//this padding box the whole vtasck down after push up by spacer()
            }.padding(.top,100)
            Spacer()
                }
            }
    //out of body
    // Function to navigate to NextScreen
        func navigateToRegisterScreen() {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                window.rootViewController = UIHostingController(rootView: RegisterScreenView())
                window.makeKeyAndVisible()
            }
        }
    
    func navigateToHomeView() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: HomeView())
            window.makeKeyAndVisible()
        }
    }

        }
       


#Preview {
    LoginView()
}
