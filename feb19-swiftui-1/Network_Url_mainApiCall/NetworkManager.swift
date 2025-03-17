//
//  Untitled.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/14/25.
//
import Foundation
enum NetworkError: Error {
    case badURL
    case badResponse
    case decodingError
}


    final class NetworkManager {
       
        static let shared = NetworkManager()
       
        private init() {}
       
        func fetch<T: Decodable>(url: String, model: T.Type) async throws -> T {
            guard let url = URL(string: url) else { throw NetworkError.badURL }
           
            var request = URLRequest(url: url)
            request.setValue("YourAppName (your@email.com)", forHTTPHeaderField: "User-Agent")

            let (data, response) = try await URLSession.shared.data(for: request)
           
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.badResponse
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return decodedData
            } catch {
                throw NetworkError.decodingError
            }
        }
    }


