//
//  MyTextfieldTextColorView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/4/25.
//

import SwiftUI

struct MyTextfieldTextColorView: View {
    @State private var text: String = ""
    var placeHolderText:String = "hello"
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeHolderText)
                    .foregroundColor(.gray) // Change to desired color
                    .padding(.horizontal, 12)
            }
            TextField("", text: $text)
                .foregroundColor(.black)
                .padding(8)
                .background(Color.red)
        }
        .padding()
    }
}

#Preview {
    MyTextfieldTextColorView()
}

