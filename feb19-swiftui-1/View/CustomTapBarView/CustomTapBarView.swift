//
//  CustomTapBarView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 5/7/25.
//

import SwiftUI

    struct CustomTapBarView: View {

        @Binding var selectedTab: Int

        let icons: [String]

        var body: some View {

            GeometryReader { geo in

                let tabCount = icons.count

                let pillWidth = geo.size.width

                let tabWidth = pillWidth / CGFloat(tabCount)

                ZStack {

                    // Dumbbell-shaped black background

                    HStack(spacing: 0) {

                        Circle()

                            .fill(Color.black)

                            .frame(width: 64, height: 64)

                        Capsule()

                            .fill(Color.black)

                            .frame(height: 64)

                        Circle()

                            .fill(Color.black)

                            .frame(width: 64, height: 64)

                    }

                    .frame(width: pillWidth, height: 64)

                    .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)



                    // Animated selection circle

                    Circle()

                        .fill(Color.orange)

                        .frame(width: 48, height: 48)

                        .offset(x: CGFloat(selectedTab) * tabWidth + (tabWidth - 48) / 2 - pillWidth/2 + 64/2, y: 0)

                        .animation(.spring(response: 0.4, dampingFraction: 0.7), value: selectedTab)

                    // Tab icons

                    HStack(spacing: 0) {

                        ForEach(0..<tabCount, id: \.self) { index in

                            Button(action: {

                                withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {

                                    selectedTab = index

                                }

                            }) {

                                Image(systemName: icons[index])

                                    .resizable()

                                    .aspectRatio(contentMode: .fit)

                                    .frame(width: 28, height: 28)

                                    .foregroundColor(selectedTab == index ? .white : .gray)

                                    .frame(maxWidth: .infinity)

                            }

                        }

                    }

                    .frame(height: 64)

                }

            }

            .frame(height: 64)

            .padding(.horizontal, 24)

            .padding(.bottom, 16)

        }

    }

#Preview {
    CustomTapBarView(selectedTab: .constant(1), icons: ["house.fill", "pawprint", "heart"])
}
