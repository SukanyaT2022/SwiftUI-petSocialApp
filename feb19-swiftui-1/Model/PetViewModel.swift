//
//  PetViewModel.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 7/10/25.
// readData from backend


import Foundation
import FirebaseFirestore

class PetViewModel: ObservableObject {
    @Published var pets: [PetFireBase] = []

    private var db = Firestore.firestore()

    func fetchPets() {
        db.collection("petCollectionArray")
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error fetching pets: \(error.localizedDescription)")
                    return
                }

                    self.pets = snapshot?.documents.compactMap { doc in
                        try? doc.data(as:PetFireBase.self)
                                    } ?? []
                                }
                        }
                    }
