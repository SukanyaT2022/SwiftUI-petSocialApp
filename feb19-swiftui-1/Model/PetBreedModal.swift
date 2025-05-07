//
//  PetBreedModal.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 5/5/25.
//

import Foundation
import Foundation

struct PetsContainer: Codable {
    let pets: [PetBreedModal]
}

struct PetBreedModal: Identifiable, Codable {
    let id = UUID()
    let petName: String
    let type: String
    let address: Address
    let yearOfBirth: Int
    let age: Int
    let breed: String
    let activities: [String]
    let image: String

    enum CodingKeys: String, CodingKey {
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

struct Address: Codable {
    let street: String
    let city: String
    let state: String
}


