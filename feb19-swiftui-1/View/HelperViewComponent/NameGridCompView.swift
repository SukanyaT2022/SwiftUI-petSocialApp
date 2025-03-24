//
//  NameGridCompView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/24/25.
//

import SwiftUI

struct NameGridCompView: View {
    var body: some View {
        HStack{
            
            Text("Spark")
                .font(Font.system(size: 35, weight: .bold))
                .fontWeight(.bold)
            Spacer()
            Image(systemName: "info.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing,10)
            Image(systemName: "square.grid.2x2.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.gray)
        }
        .padding(.horizontal,30)
    }
}

#Preview {
    NameGridCompView()
}
