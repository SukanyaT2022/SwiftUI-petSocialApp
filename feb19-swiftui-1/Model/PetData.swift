//
//  Untitled.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/14/25.
//
import Foundation
struct PetData: Codable{
  
    let data: [Pet]
    let meta: Meta?
    let links: Link?
}
// Codable is a protocol that help us in encoding and decoding of the json to swift object and swift object to json
struct Meta: Codable {
    
}

struct Link: Codable {
    
}

struct Pet: Codable,Identifiable {
    let id: String
    let type: String
    let attributes:Attributes?
    let relationship: Relationship?
}

struct Attributes: Codable {
    let name: String?
    let description: String?
}

struct Relationship: Codable {
    
}
