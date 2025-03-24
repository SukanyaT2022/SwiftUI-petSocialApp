//
//  RoundTextFieldComp.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 2/19/25.
//

import SwiftUI

struct RoundTextFieldComp: View {
    @State var filledValue:String = ""
    var placeholder:String = "test"
    
    var body: some View {
        TextField(placeholder, text: $filledValue)
            .frame(height: 44)
            .multilineTextAlignment(.center)
            .foregroundStyle(.blue)
          
            .padding(.horizontal, 30)
            .padding(.vertical, 5)
            .background(Color.white) // Ensure background is set
            .cornerRadius(10)
        
        
        //overlay is like z-index
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 1.2)
                    .padding([.leading,.trailing],16 )
            )
    }
}

#Preview {
    RoundTextFieldComp()
}
