//
//  feb19_swiftui_1App.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 2/19/25.
//

import SwiftUI
import Firebase
@main
struct feb19_swiftui_1App: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        
        WindowGroup {
            SimpleTabBarView()
//            PetListView()
        }
    }
}
