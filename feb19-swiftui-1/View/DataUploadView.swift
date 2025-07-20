//
//  DataUploadView.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 1/19/25.
//

import SwiftUI

struct DataUploadView: View {
    @StateObject private var uploadService = FirebaseUploadService()
    @State private var existingDataCount = 0
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // Header
                VStack(spacing: 10) {
                    Image(systemName: "icloud.and.arrow.up")
                        .font(.system(size: 60))
                        .foregroundColor(.blue)
                    
                    Text("Upload Pet Data to Firebase")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)
                
                // Status Section
                VStack(spacing: 15) {
                    
                    // Existing data info
                    if existingDataCount > 0 {
                        VStack {
                            Text("⚠️ Warning")
                                .font(.headline)
                                .foregroundColor(.orange)
                            Text("\(existingDataCount) pets already exist in Firestore")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(Color.orange.opacity(0.1))
                        .cornerRadius(10)
                    }
                    
                    // Upload progress
                    if uploadService.isUploading {
                        VStack(spacing: 10) {
                            ProgressView(value: uploadService.uploadProgress)
                                .progressViewStyle(LinearProgressViewStyle())
                            
                            Text(uploadService.uploadMessage)
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    // Upload message
                    if !uploadService.uploadMessage.isEmpty && !uploadService.isUploading {
                        Text(uploadService.uploadMessage)
                            .font(.subheadline)
                            .foregroundColor(.green)
                            .padding()
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(10)
                    }
                    
                    // Error message
                    if let error = uploadService.uploadError {
                        Text(error)
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .padding()
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(10)
                    }
                }
                
                Spacer()
                
                // Action Buttons
                VStack(spacing: 15) {
                    
                    // Upload Button
                    Button(action: {
                        Task {
                            await uploadService.uploadPetDataToFirestore()
                        }
                    }) {
                        HStack {
                            Image(systemName: "arrow.up.circle.fill")
                            Text("Upload JSON Data to Firestore")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(uploadService.isUploading ? Color.gray : Color.blue)
                        .cornerRadius(10)
                    }
                    .disabled(uploadService.isUploading)
                    
                    // Clear Data Button (if data exists)
                    if existingDataCount > 0 && !uploadService.isUploading {
                        Button(action: {
                            alertMessage = "Are you sure you want to delete all \(existingDataCount) existing pets from Firestore?"
                            showAlert = true
                        }) {
                            HStack {
                                Image(systemName: "trash.circle.fill")
                                Text("Clear Existing Data")
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                        }
                    }
                    
                    // Refresh Button
                    Button(action: {
                        Task {
                            existingDataCount = await uploadService.checkExistingData()
                        }
                    }) {
                        HStack {
                            Image(systemName: "arrow.clockwise.circle.fill")
                            Text("Check Existing Data")
                        }
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                    }
                    .disabled(uploadService.isUploading)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Data Upload")
            .onAppear {
                Task {
                    existingDataCount = await uploadService.checkExistingData()
                }
            }
            .alert("Confirm Delete", isPresented: $showAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Delete", role: .destructive) {
                    Task {
                        await uploadService.clearExistingData()
                        existingDataCount = await uploadService.checkExistingData()
                    }
                }
            } message: {
                Text(alertMessage)
            }
        }
    }
}

#Preview {
    DataUploadView()
} 