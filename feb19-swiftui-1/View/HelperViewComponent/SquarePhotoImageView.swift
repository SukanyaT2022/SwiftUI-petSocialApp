//
//  SquarePhotoImageView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/23/25.
//

import SwiftUI

struct SquarePhotoImageView: View {
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Image(systemName: "camera.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .aspectRatio(contentMode: .fit)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 60))
            }
          
            Image("m1")
                .resizable()
                .frame(width: 200, height: 200)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(30)
            
            
//            Zstack is zIndex put something on top
//            ZStack(alignment: .bottomTrailing){
//                Image("m1")
//                    .resizable()
//                    .frame(width: 300, height: 300)
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(30)
//                Text("ZstackTest")
//                    .font(.title)
//                    .foregroundColor(.red)
//                    .padding()
//            }
//           
         
      
        }
    }
}

#Preview {
    SquarePhotoImageView()
}
