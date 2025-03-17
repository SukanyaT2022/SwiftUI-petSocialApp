//
//  Untitled.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/14/25.
//
import Foundation
struct PetData: Codable{
  
    let data: [Pet]
}

struct Pet: Codable,Identifiable {
    let id: String
    let type: String
    let attributes:Attributes?
    let relationship: Relationship?
}

struct Attributes: Codable {
    
}

struct Relationship: Codable {
    
}
