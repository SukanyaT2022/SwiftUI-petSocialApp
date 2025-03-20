//
//  ApiCall.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/17/25.
// API service help to call the api

import Foundation


enum ApiEndPoint{
    static let dogApi = "https://dogapi.dog/api/v2/breeds"
}

class APIService {
    static let shared = APIService()  // Singleton instance

    private init() {}  // Prevents multiple instances

    func fetchDogs() async throws -> PetData {
      
        // JSON ===(Big Equal to) Dictionary in swift
        // Fetch data from API
//        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try await NetworkManager.shared.fetch(url: ApiEndPoint.dogApi, model: PetData.self)
        
        // Decode JSON into an array of Post objects

    }
}
