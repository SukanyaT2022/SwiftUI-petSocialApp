//
//  OvalPetTypeMapCompView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 4/29/25.
//

import SwiftUI

struct OvalPetTypeMapCompView: View {
    var body: some View {
        VStack(spacing: 20){
            Image("img1")
                .resizable()
                .frame(width: 50, height: 50)
            Text("cat")
        }
        .frame(width: 100, height: 100)
        .background(Color.gray)
        .border(Color.blue)
        .padding(20)
        .cornerRadius(50)
       
    }
}

#Preview {
    OvalPetTypeMapCompView()
}
