//
//  SearchBoxCompView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 4/8/25.
//

import SwiftUI

struct SearchBoxCompView: View {
    @State var storeUserInput: String = ""
    var body: some View {
        HStack{
          
            Image(systemName: "magnifyingglass")
                .padding(.leading,8)
            TextField("Search here...", text: $storeUserInput)
                .padding(10)
        
        }
        .border(Color.gray, width: 1)
        .padding(16)
    }
}

#Preview {
    SearchBoxCompView()
}
