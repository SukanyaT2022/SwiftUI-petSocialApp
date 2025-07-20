//
//  FirebaseUploadService.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 1/19/25.
//

import Foundation
import FirebaseFirestore

class FirebaseUploadService: ObservableObject {
    @Published var uploadProgress: Double = 0.0
    @Published var isUploading: Bool = false
    @Published var uploadMessage: String = ""
    @Published var uploadError: String?
    
    private var db = Firestore.firestore()
    
    // Function to upload JSON data to Firestore
    func uploadPetDataToFirestore() async {
        await MainActor.run {
            isUploading = true
            uploadProgress = 0.0
            uploadError = nil
            uploadMessage = "Starting upload..."
        }
        
        do {
            // Load JSON data
            let pets = loadPetBreedsFromJSON()
            
            if pets.isEmpty {
                await MainActor.run {
                    uploadError = "No pets found in JSON file"
                    isUploading = false
                }
                return
            }
            
            await MainActor.run {
                uploadMessage = "Found \(pets.count) pets to upload"
            }
            
            // Upload each pet to Firestore
            for (index, pet) in pets.enumerated() {
                do {
                    // Convert PetBreedModal to PetBreedFirebase
                    let firebasePet = PetBreedFirebase(
                        id: nil, // Let Firestore generate the ID
                        petName: pet.petName,
                        type: pet.type,
                        address: AddressFirebase(
                            street: pet.address.street,
                            city: pet.address.city,
                            state: pet.address.state
                        ),
                        yearOfBirth: pet.yearOfBirth,
                        age: pet.age,
                        breed: pet.breed,
                        activities: pet.activities,
                        image: pet.image
                    )
                    
                    // Upload to Firestore collection
                    let _ = try await db.collection("petsCollection").addDocument(from: firebasePet)
                    
                    // Update progress
                    let progress = Double(index + 1) / Double(pets.count)
                    await MainActor.run {
                        uploadProgress = progress
                        uploadMessage = "Uploaded \(index + 1)/\(pets.count) pets"
                    }
                    
                    print("✅ Uploaded pet: \(pet.petName)")
                    
                } catch {
                    print("❌ Failed to upload pet \(pet.petName): \(error.localizedDescription)")
                    await MainActor.run {
                        uploadError = "Failed to upload \(pet.petName): \(error.localizedDescription)"
                    }
                }
            }
            
            await MainActor.run {
                isUploading = false
                uploadMessage = "Upload completed! \(pets.count) pets uploaded successfully"
                print("🎉 All pets uploaded successfully to Firestore!")
            }
            
        } catch {
            await MainActor.run {
                uploadError = "Upload failed: \(error.localizedDescription)"
                isUploading = false
            }
            print("❌ Upload error: \(error.localizedDescription)")
        }
    }
    
    // Load JSON data (reusing your existing function)
    private func loadPetBreedsFromJSON() -> [PetBreedModal] {
        guard let url = Bundle.main.url(forResource: "PetData", withExtension: "json") else {
            print("❌ PetData.json not found in bundle")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let petsContainer = try decoder.decode(PetsContainer.self, from: data)
            return petsContainer.pets
        } catch {
            print("❌ Failed to load or decode PetData.json: \(error)")
            return []
        }
    }
    
    // Function to check if data already exists in Firestore
    func checkExistingData() async -> Int {
        do {
            let snapshot = try await db.collection("petsCollection").getDocuments()
            return snapshot.documents.count
        } catch {
            print("❌ Error checking existing data: \(error.localizedDescription)")
            return 0
        }
    }
    
    // Function to clear existing data (optional)
    func clearExistingData() async {
        do {
            let snapshot = try await db.collection("petsCollection").getDocuments()
            
            for document in snapshot.documents {
                try await document.reference.delete()
            }
            
            await MainActor.run {
                uploadMessage = "Cleared \(snapshot.documents.count) existing documents"
            }
            
        } catch {
            print("❌ Error clearing data: \(error.localizedDescription)")
        }
    }
} 