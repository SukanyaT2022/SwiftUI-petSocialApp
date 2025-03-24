//
//  AddPhotoCompView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/21/25.
//

import SwiftUI

struct AddPhotoCompView: View {
    var body: some View {
        VStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(Color(hex:AppThemeColor.lightGray))
        
        }
//        zindex- overlay
        .overlay(alignment: .trailing) {
            Image(systemName: "plus.circle")
                .resizable()
                .frame(width: 25, height: 25)
                .offset(x: 15, y: -5)
                .foregroundColor(Color(hex:AppThemeColor.yellow))
        }
    }
}

#Preview {
    AddPhotoCompView()
}
