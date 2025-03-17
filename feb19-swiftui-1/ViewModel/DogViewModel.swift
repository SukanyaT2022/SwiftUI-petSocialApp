//
//  Untitled.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/17/25.
// mangae all the data - logic - api calling
import SwiftUI
@MainActor
class DogViewModel: ObservableObject {
    @Published var petData: [PetData] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadDogList() async {
        isLoading = true
        errorMessage = nil
        do {
            petData = try await APIService.shared.fetchDogs()
        } catch {
            errorMessage = "Failed to fetch posts: \(error.localizedDescription)"
        }
        isLoading = false
    }
}
