//
//  RoundTextFieldComp.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 2/19/25.
//

import SwiftUI

struct RoundTextFieldComp: View {
    @State var filledValue:String = ""
    
 var placeholder:String = ""
    
    var body: some View {
        TextField( placeholder, text: $filledValue)
            .frame(height: 44)
            .multilineTextAlignment(TextAlignment.center)
            .foregroundStyle(.blue)
        .border(.blue)
       
        .padding([.leading,.trailing],16)
        .padding([.top,.bottom],5)
    }
}

#Preview {
    RoundTextFieldComp()
}
