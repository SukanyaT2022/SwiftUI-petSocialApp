//
//  SearchFriendView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 4/21/25.
//

import SwiftUI

struct SearchFriendView: View {
   
    var body: some View {
        VStack(spacing: 10){
            SearchBoxCompView()
            
            SingleBoxMapCompView()
                .padding(.horizontal, 20)
                .frame( height: 80)
            Spacer()
        }
        .padding(.top,20)
      
    
       
    }
}
#Preview {
    SearchFriendView()
}
