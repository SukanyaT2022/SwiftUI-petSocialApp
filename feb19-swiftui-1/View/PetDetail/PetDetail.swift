//
//  dddfView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/24/25.
//

import SwiftUI

struct PetDetail: View {
    var body: some View {
        VStack{

            SquarePhotoImageView()
            NameGridCompView()
            Spacer()
            
        }
       
     //padding for the parent
        .padding(20)
    }
}

#Preview {
    PetDetail()
}
