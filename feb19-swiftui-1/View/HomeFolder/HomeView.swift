//
//  HomeView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/13/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var searchText:String = ""
    
    
    var body: some View {
        
        NavigationStack{
            VStack{
                
         
                
            }
            .searchable(text: $searchText)
            //above end navigation stack
            
            
        }
    }
    
}
#Preview {
    HomeView()
}
