//
//  PetListView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 7/10/25.
//


import SwiftUI

struct PetListView: View {
    @StateObject var viewModel = PetViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.pets) { pet in
                VStack(alignment: .leading) {
                    Text(pet.name)
                        .font(.headline)
                    Text("Breed: \(pet.breed)")
                        .font(.subheadline)
                    Text("Age: \(pet.age) years")
                        .font(.footnote)
                        .foregroundColor(.gray)
                                    }
                                }
                                .navigationTitle("Pet List")
                            }
                            .onAppear {
                                viewModel.fetchPets()
                            }
                        }
                    }
