//
//  FactData.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/19/25.
//

struct FactData: Codable {
    let data: [Fact]

}

struct Fact: Codable {
    let id: String
    let type:String
    let attributes: AttributesFact
}
struct AttributesFact: Codable {
    let body: String
}
