//
//  Pet.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 7/10/25.
//


import Foundation
import FirebaseFirestore

struct PetFireBase: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var breed: String
    var age: Int
}

// New comprehensive Firebase model that matches JSON structure
struct PetBreedFirebase: Identifiable, Codable {
    @DocumentID var id: String?
    var petName: String
    var type: String
    var address: AddressFirebase
    var yearOfBirth: Int
    var age: Int
    var breed: String
    var activities: [String]
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case petName = "pet_name"
        case type
        case address
        case yearOfBirth = "year_of_birth"
        case age
        case breed
        case activities
        case image
    }
}

struct AddressFirebase: Codable {
    var street: String
    var city: String
    var state: String
}
