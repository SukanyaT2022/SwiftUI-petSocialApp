//
//  ContentView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 2/19/25.
//

import SwiftUI
import FirebaseAuth // FirebaseAuth is a third party sdk of firebase

struct LoginView: View {
    @State var usernameVar: String = ""
    @State var passwordVar: String = ""
    @State var showAlert: Bool = false
    @State var alertMessage: String = ""
    @StateObject private var userManager = UserManager()
    
    func signIn(email: String, password: String) {
        Task {
            do {
                try await userManager.signIn(email: email, password: password)
                // Access Firebase User properties
                if let user = userManager.currentUser {
                    print("✅ Signed in user:")
                    print("   - UID: \(user.uid)")
                    print("   - Email: \(user.email ?? "No email")")
                    print("   - Display Name: \(user.displayName ?? "No display name")")
                    print("   - Email Verified: \(user.isEmailVerified)")
                    print("   - Created: \(user.createdAt?.formatted() ?? "Unknown")")
                    print("   - Last Sign In: \(user.lastSignInDate?.formatted() ?? "Unknown")")
                }
                navigateToHomeView()
            } catch {
                showAlert = true
                alertMessage = "Sign-in error: \(error.localizedDescription)"
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 20) {
                
                // Top header view
                Image(systemName: "dog")
                    .resizable()
                    .frame(width: 100, height: 80)
                    .foregroundStyle(.blue)
                
                Text("Welcome to pet social!")
                    .padding(.bottom, 15)
                    .font(.custom("SourGummy-Medium", size: 24))

                VStack(spacing: 20) {
                    RoundTextFieldComp(filledValue: usernameVar, placeholder: "Email")
                    RoundTextFieldComp(filledValue: passwordVar, placeholder: "Password")
                }
                
                ButtonComp(handler: {
                    if usernameVar.isEmpty && passwordVar.isEmpty {
                        showAlert = true
                        alertMessage = "Please enter email and password!"
                    } else if usernameVar.isEmpty {
                        showAlert = true
                        alertMessage = "Please enter email!"
                    } else if passwordVar.isEmpty {
                        showAlert = true
                        alertMessage = "Please enter password!"
                    } else {
                        // Use actual input values instead of hardcoded ones
                        signIn(email: usernameVar, password: passwordVar)
                    }
                })
                
                Text("No Account? Please register")
                    .onTapGesture {
                        navigateToRegisterScreen()
                    }
                
                // Display current user info if signed in
                if userManager.isSignedIn, let user = userManager.currentUser {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Current User Info:")
                            .font(.headline)
                        Text("UID: \(user.uid)")
                        Text("Email: \(user.email ?? "No email")")
                        Text("Name: \(user.displayName ?? "No name")")
                        Text("Verified: \(user.isEmailVerified ? "Yes" : "No")")
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
                
            }.padding(.top, 100)
            Spacer()
        }
        .alert("Error", isPresented: $showAlert) {
            Button("OK") { }
        } message: {
            Text(alertMessage)
        }
    }

    // Function to navigate to NextScreen
    func navigateToRegisterScreen() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: RegisterScreenView())
            window.makeKeyAndVisible()
        }
    }
    
    func navigateToHomeView() {
        //this line for homepage
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
