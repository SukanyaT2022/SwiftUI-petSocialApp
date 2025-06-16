//
//  Untitled.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/17/25.
// mangae all the data - logic - api calling
import SwiftUI
@MainActor
class DogViewModel: ObservableObject {
    @Published var petData: PetData?//PetData? is class- user define data type
    @Published var factData: FactData?
    @Published var isLoading = false
    @Published var errorMessage: String?
 //all logic deal with datat we keep in view model

    //first api for a list of dog
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
    //second api
    func loadFact() async {
        isLoading = true
        errorMessage = nil
        do {
            factData = try await APIService.shared.fetchFactData()
        } catch {
            errorMessage = "Failed to fetch posts: \(error.localizedDescription)"
        }
        isLoading = false
    }
}
