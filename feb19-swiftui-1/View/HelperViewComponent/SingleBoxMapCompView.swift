//
//  SmallSquareBoxView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 4/21/25.
//

import SwiftUI

struct SingleBoxMapCompView: View {
    let friendTypeArr = ["Dog", "Cat", "Bird", "Bunny", "Fish", "Guinea pig","Chinchilla", "Reptiles", "Hamster", "aaaaaaaaaaaaaa bbbbbbb"]
    
    var rows: [GridItem] = [
        GridItem(.flexible(minimum: 50))
    ]
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows: rows, spacing: 10) {
                ForEach(friendTypeArr, id: \.self) { item in
                    Text(item)
                    
                        .frame(width: 100)
                        .frame(height: 50)
                        .lineLimit(2, reservesSpace: false)//2 line only after that show ...
                        .padding(.horizontal,8)
                        .background(Color.white.opacity(0.2))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.orange, lineWidth: 2)
                                .padding(.horizontal,2)
                        )
                }
            }
        }
      
        
    }
}

#Preview {
    SingleBoxMapCompView()
}
