//
//  CatergoryViewAllBarView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 4/10/25.
//

import SwiftUI

struct CatergoryViewAllBarView: View {
    var leftTitle: String?
    var buttonTitle: String?
    var tappedHandler: (()-> Void)?//closeur
    
    var body: some View {
        HStack{
            Text(leftTitle ?? "test")
                .font(.title2)
            Spacer()
       Button {
                tappedHandler?()
            } label: {
                Text(buttonTitle ?? "test2")
                    .font(.title2)
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal,16)
    }
}

#Preview {
    CatergoryViewAllBarView()
}
