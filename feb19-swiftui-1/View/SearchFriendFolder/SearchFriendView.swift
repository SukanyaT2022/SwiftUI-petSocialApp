//
//  SearchFriendView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 4/21/25.
//

import SwiftUI

struct SearchFriendView: View {
   
    var body: some View {
        VStack(spacing: 1){
            SearchBoxCompView(borderColorVar: .init(Color(hex: AppThemeColor.orange)))
            
            SingleBoxMapCompView()
                .padding(.horizontal, 20)
                .frame( height: 80)
            StaggeredGridExample()
        }
        .padding(.top,20)
        VStack{
      
        }
    
       
    }
}
#Preview {
    SearchFriendView()
}
