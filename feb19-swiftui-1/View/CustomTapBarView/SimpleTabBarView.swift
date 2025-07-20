//
//  SimpleTabBarView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 5/7/25.
//

import SwiftUI

struct SimpleTabBarView: View {
    var body: some View {
        TabView {
            //attach home view with tab view
            //each view have it own navigation stack
            NavigationStack{
                HomeView()
                 
                    .toolbar(.visible, for: .navigationBar)
                             
            }
            //close navigation
                .tabItem {
                    Label("Main", systemImage: "house")
                }
     
        //close navigationStack
            
          
            LoginView()
                .tabItem {
                    Label("Favourite", systemImage: "heart.fill")
                }
                
            DataUploadView()
                .tabItem {
                    Label("Upload", systemImage: "icloud.and.arrow.up")
                }
                
            LoginView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }//close table view
        
        //target icon - change color when click
//        .tint(Color(Color(hex: AppThemeColor.veryLightGray)))
     
        .tint(Color(Color(hex: AppThemeColor.orange)))
    }
}

//below for testing after test we donot need it
//struct MainHomeView: View {
//    var body: some View {
//        Text("ProspectsView")
//    }
//}
//struct ProfileView: View {
//    var body: some View {
//        Text("ProspectsView")
//    }
//}
//struct Favourite: View {
//    var body: some View {
//        Text("ProspectsView")
//    }
//}
//struct SearchView: View {
//    var body: some View {
//        Text("ProspectsView")
//    }
//}
#Preview {
    SimpleTabBarView()
}
