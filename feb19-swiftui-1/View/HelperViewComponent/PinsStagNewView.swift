//
//  PinsStagNewView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 4/25/25.
//

import SwiftUI



struct PinsStagNewView: Layout {

    var columns: Int

    var spacing: CGFloat = 12



    struct CacheData {

        var sizes: [CGSize]

    }



    func makeCache(subviews: Subviews) -> CacheData {

        // Placeholder; actual sizes are calculated in `sizeThatFits`

        CacheData(sizes: Array(repeating: .zero, count: subviews.count))

    }



    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) -> CGSize {

        let width = proposal.width ?? 0

        let columnWidth = (width - spacing * CGFloat(columns - 1)) / CGFloat(columns)

        var columnHeights = Array(repeating: CGFloat(0), count: columns)



        for (index, subview) in subviews.enumerated() {

            let size = subview.sizeThatFits(ProposedViewSize(width: columnWidth, height: nil))

            cache.sizes[index] = size



            let shortestColumn = columnHeights.enumerated().min(by: { $0.element < $1.element })!.offset

            columnHeights[shortestColumn] += size.height + spacing

        }



        return CGSize(width: width, height: columnHeights.max() ?? 0)

    }



    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) {

        let columnWidth = (bounds.width - spacing * CGFloat(columns - 1)) / CGFloat(columns)

        var columnHeights = Array(repeating: CGFloat(0), count: columns)



        for (index, subview) in subviews.enumerated() {

            let size = cache.sizes[index]

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

    struct MasonryImage: Identifiable {

        let id = UUID()

        let url: URL

        let height: CGFloat

    }



    let sampleImages: [MasonryImage] = [

        .init(url: URL(string: "https://images.unsplash.com/photo-1506744038136-46273834b3fb")!, height: 200),

        .init(url: URL(string: "https://images.unsplash.com/photo-1607746882042-944635dfe10e")!, height: 250),

        .init(url: URL(string: "https://images.unsplash.com/photo-1519681393784-d120267933ba")!, height: 180),

        .init(url: URL(string: "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d")!, height: 220),

        .init(url: URL(string: "https://images.unsplash.com/photo-1521747116042-5a810fda9664")!, height: 260),

        .init(url: URL(string: "https://images.unsplash.com/photo-1491553895911-0055eca6402d")!, height: 230),

        .init(url: URL(string: "https://images.unsplash.com/photo-1606787366850-de6330128bfc")!, height: 240),

        .init(url: URL(string: "https://images.unsplash.com/photo-1470770841072-f978cf4d019e")!, height: 210),

        .init(url: URL(string: "https://images.unsplash.com/photo-1495567720989-cebdbdd97913")!, height: 190),

        .init(url: URL(string: "https://images.unsplash.com/photo-1469474968028-56623f02e42e")!, height: 270)

    ]



    var body: some View {

        GeometryReader { geometry in

            let columnCount = 2

            let spacing: CGFloat = 12

            let horizontalPadding: CGFloat = 12

            let totalSpacing = spacing * CGFloat(columnCount - 1)

            let columnWidth = (geometry.size.width - totalSpacing - (horizontalPadding * 2)) / CGFloat(columnCount)



            ScrollView {

                PinsStagNewView(columns: columnCount, spacing: spacing) {

                    ForEach(sampleImages) { imageItem in

                        AsyncImage(url: imageItem.url) { phase in

                            switch phase {

                            case .success(let image):

                                image

                                    .resizable()

                                    .aspectRatio(contentMode: .fill)

                                    .frame(width: columnWidth, height: imageItem.height)

                                    .clipped()

                                    .cornerRadius(10)

                            case .failure(_):

                                Color.gray

                                    .frame(width: columnWidth, height: imageItem.height)

                                    .cornerRadius(10)

                            case .empty:

                                Color.gray.opacity(0.3)

                                    .frame(width: columnWidth, height: imageItem.height)

                                    .cornerRadius(10)

                            @unknown default:

                                EmptyView()

                            }

                        }

                        .shadow(radius: 3)

                    }

                }

                .padding(.horizontal, horizontalPadding)

                .padding(.vertical)

            }

        }

    }

}







#Preview {

    StaggeredGridExample()

}


