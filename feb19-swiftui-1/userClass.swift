//
//  userClass.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 3/3/25.
//

import Foundation
import FirebaseAuth

// MARK: - Basic UserClass (for UI forms)
struct UserClass {
    var name: String = ""
    var username: String = ""
    var password: String = ""
    var email: String = ""
}

// MARK: - Firebase User Model (for authenticated users)
struct FirebaseUserModel {
    // Firebase User Properties
    var uid: String
    var email: String?
    var displayName: String?
    var photoURL: URL?
    var phoneNumber: String?
    var isEmailVerified: Bool
    var isAnonymous: Bool
    
    // Additional custom properties
    var username: String?
    var createdAt: Date?
    var lastSignInDate: Date?
    
    // Initialize from Firebase User
    init(from firebaseUser: User) {
        self.uid = firebaseUser.uid
        self.email = firebaseUser.email
        self.displayName = firebaseUser.displayName
        self.photoURL = firebaseUser.photoURL
        self.phoneNumber = firebaseUser.phoneNumber
        self.isEmailVerified = firebaseUser.isEmailVerified
        self.isAnonymous = firebaseUser.isAnonymous
        self.createdAt = firebaseUser.metadata.creationDate
        self.lastSignInDate = firebaseUser.metadata.lastSignInDate
    }
}

// MARK: - User Manager (ObservableObject for SwiftUI)
class UserManager: ObservableObject {
    @Published var currentUser: FirebaseUserModel?
    @Published var isSignedIn = false
    
    init() {
        // Listen for authentication state changes
        Auth.auth().addStateDidChangeListener { _, user in
            if let user = user {
                self.currentUser = FirebaseUserModel(from: user)
                self.isSignedIn = true
            } else {
                self.currentUser = nil
                self.isSignedIn = false
            }
        }
    }
    
    // MARK: - Authentication Methods
    
    func signIn(email: String, password: String) async throws {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        print("✅ User signed in: \(result.user.uid)")
    }
    
    func signUp(email: String, password: String, displayName: String? = nil) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        
        // Update display name if provided
        if let displayName = displayName {
            let changeRequest = result.user.createProfileChangeRequest()
            changeRequest.displayName = displayName
            try await changeRequest.commitChanges()
        }
        
        print("✅ User created: \(result.user.uid)")
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
        print("✅ User signed out")
    }
    
    func updateUserProfile(displayName: String?, photoURL: URL?) async throws {
        guard let user = Auth.auth().currentUser else { return }
        
        let changeRequest = user.createProfileChangeRequest()
        changeRequest.displayName = displayName
        changeRequest.photoURL = photoURL
        try await changeRequest.commitChanges()
        
        // Refresh current user data
        try await user.reload()
        self.currentUser = FirebaseUserModel(from: user)
    }
    
    func sendEmailVerification() async throws {
        guard let user = Auth.auth().currentUser else { return }
        try await user.sendEmailVerification()
    }
    
    func updateEmail(_ newEmail: String) async throws {
        guard let user = Auth.auth().currentUser else { return }
        try await user.updateEmail(to: newEmail)
    }
    
    func updatePassword(_ newPassword: String) async throws {
        guard let user = Auth.auth().currentUser else { return }
        try await user.updatePassword(to: newPassword)
    }
    
    func deleteAccount() async throws {
        guard let user = Auth.auth().currentUser else { return }
        try await user.delete()
    }
}


