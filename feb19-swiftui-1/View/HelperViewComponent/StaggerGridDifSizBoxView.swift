//
//  StaggerGridDifSizBoxView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 4/22/25.
//

import SwiftUI

struct StaggerGridDifSizBoxView: View {
    var body: some View {
        let images = [
                (name: "m1", aspectRatio: 1.5),
                (name: "m2", aspectRatio: 0.8),
                (name: "img1", aspectRatio: 1.2),
                (name: "img2", aspectRatio: 1.5),
                (name: "imgCat3", aspectRatio: 0.8),
                (name: "imgCat4", aspectRatio: 1.2),
            ]
            
            let columns = 2
            
         
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: columns), spacing: 10) {
                        ForEach(0..<images.count, id: \.self) { index in
                            GeometryReader { geometry in
                                Image(images[index].name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: geometry.size.width / images[index].aspectRatio)
                                    .clipped()
                            }
                            .aspectRatio(images[index].aspectRatio, contentMode: .fit)
                        }
                    }
                    .padding()
                }
         
    }
}

#Preview {
    StaggerGridDifSizBoxView()
}
