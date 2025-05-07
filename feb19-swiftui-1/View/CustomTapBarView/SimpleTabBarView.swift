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
            HomeView()
                .tabItem {
                    Label("Main", systemImage: "house")
                }
            
           HomeView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            LoginView()
                .tabItem {
                    Label("Favourite", systemImage: "heart.fill")
                }
            PetRegister()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
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
//#Preview {
//    SimpleTabBarView()
//}
