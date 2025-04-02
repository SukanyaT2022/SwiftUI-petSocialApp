//
//  SquareBoxSocialmediaView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 4/2/25.
//

import SwiftUI

struct SquareBoxSocialmediaView: View {
    var body: some View {
    
            Image("m2")
                .resizable()
                .frame(width: 150, height: 150)
                .aspectRatio(contentMode:.fill)
                .clipped()
                .cornerRadius(10)
          
     
    }
}

#Preview {
    SquareBoxSocialmediaView()
}
