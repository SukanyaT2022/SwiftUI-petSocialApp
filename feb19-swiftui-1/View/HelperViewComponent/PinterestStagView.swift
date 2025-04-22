//
//  PinterestStagView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 4/22/25.
//

import SwiftUI


import SwiftUI

struct StaggeredGridLayout: Layout {
    var columns: Int
    var spacing: CGFloat = 8
    
 
        

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let width = proposal.width ?? 0
        let columnWidth = (width - spacing * CGFloat(columns - 1)) / CGFloat(columns)
       
        var columnHeights = Array(repeating: CGFloat(0), count: columns)

        for subview in subviews {
            let size = subview.sizeThatFits(
                ProposedViewSize(width: columnWidth, height: nil)
            )
            let shortestColumn = columnHeights.enumerated().min(by: { $0.element < $1.element })!.offset
            columnHeights[shortestColumn] += size.height + spacing
        }

        return CGSize(width: width, height: columnHeights.max() ?? 0)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let columnWidth = (bounds.width - spacing * CGFloat(columns - 1)) / CGFloat(columns)
        var columnHeights = Array(repeating: CGFloat(0), count: columns)

        for subview in subviews {
            let size = subview.sizeThatFits(
                ProposedViewSize(width: columnWidth, height: nil)
            )
            let shortestColumn = columnHeights.enumerated().min(by: { $0.element < $1.element })!.offset

            let x = CGFloat(shortestColumn) * (columnWidth + spacing)
            let y = columnHeights[shortestColumn]

            subview.place(
                at: CGPoint(x: bounds.minX + x, y: bounds.minY + y),
                proposal: ProposedViewSize(width: columnWidth, height: size.height)
            )

            columnHeights[shortestColumn] += size.height + spacing
        }
    }
}




struct StaggeredGridExample: View {

    let images = [
            "m1",
           "m2",
            "img1",
          "img2",
           "imgCat3",
        "imgCat4",
        ]
    var body: some View {
        ScrollView {
            StaggeredGridLayout(columns: 2, spacing: 12) {
                ForEach(images, id: \.self) { item in
                    VStack {
                        Rectangle()
                            .fill(Color.blue.opacity(0.5))
                            .frame(height: CGFloat.random(in: 100...220))
                            .cornerRadius(8)
                        Image(item)
                            .aspectRatio(contentMode: .fill)
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                }
            }
            .padding()
        }
    }
}
#Preview {
    StaggeredGridExample()
}
