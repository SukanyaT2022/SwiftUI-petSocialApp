# Firebase Authentication User Properties - Complete Guide

## Overview
Firebase Authentication provides a comprehensive `User` object with many built-in properties and methods. This guide covers all available properties and their usage in SwiftUI/iOS applications.

## Core Firebase User Properties

### 1. **Basic Identity Properties**

```swift
// User ID - Unique identifier for the user
let uid: String = user.uid

// Email address
let email: String? = user.email

// Display name (can be set during registration or updated later)
let displayName: String? = user.displayName

// Profile photo URL
let photoURL: URL? = user.photoURL

// Phone number (if phone authentication is used)
let phoneNumber: String? = user.phoneNumber
```

### 2. **Account Status Properties**

```swift
// Email verification status
let isEmailVerified: Bool = user.isEmailVerified

// Anonymous user status
let isAnonymous: Bool = user.isAnonymous

// Check if user is enabled (not disabled by admin)
let isDisabled: Bool = user.isDisabled
```

### 3. **Metadata Properties**

```swift
// Account creation date
let creationDate: Date? = user.metadata.creationDate

// Last sign-in date
let lastSignInDate: Date? = user.metadata.lastSignInDate
```

### 4. **Provider Information**

```swift
// Information about sign-in providers (Google, Facebook, etc.)
let providerData: [UserInfo] = user.providerData

// Provider ID (e.g., "password", "google.com", "facebook.com")
for provider in user.providerData {
    print("Provider ID: \(provider.providerID)")
    print("UID: \(provider.uid)")
    print("Email: \(provider.email ?? "No email")")
}
```

### 5. **Token Properties**

```swift
// Refresh token (for maintaining authentication)
let refreshToken: String = user.refreshToken

// Get ID token (for backend authentication)
user.getIDToken { token, error in
    if let token = token {
        print("ID Token: \(token)")
    }
}
```

## Firebase User Methods

### 1. **Profile Management**

```swift
// Update display name and photo
func updateProfile(name: String?, photoURL: URL?) async throws {
    guard let user = Auth.auth().currentUser else { return }
    
    let changeRequest = user.createProfileChangeRequest()
    changeRequest.displayName = name
    changeRequest.photoURL = photoURL
    try await changeRequest.commitChanges()
}

// Update email
func updateEmail(newEmail: String) async throws {
    guard let user = Auth.auth().currentUser else { return }
    try await user.updateEmail(to: newEmail)
}

// Update password
func updatePassword(newPassword: String) async throws {
    guard let user = Auth.auth().currentUser else { return }
    try await user.updatePassword(to: newPassword)
}
```

### 2. **Email Verification**

```swift
// Send email verification
func sendEmailVerification() async throws {
    guard let user = Auth.auth().currentUser else { return }
    try await user.sendEmailVerification()
}

// Check verification status
func checkEmailVerification() {
    if let user = Auth.auth().currentUser {
        print("Email verified: \(user.isEmailVerified)")
    }
}
```

### 3. **Account Management**

```swift
// Reload user data from server
func reloadUserData() async throws {
    guard let user = Auth.auth().currentUser else { return }
    try await user.reload()
}

// Delete user account
func deleteAccount() async throws {
    guard let user = Auth.auth().currentUser else { return }
    try await user.delete()
}

// Re-authenticate user (required for sensitive operations)
func reauthenticate(email: String, password: String) async throws {
    guard let user = Auth.auth().currentUser else { return }
    
    let credential = EmailAuthProvider.credential(withEmail: email, password: password)
    try await user.reauthenticate(with: credential)
}
```

### 4. **Token Management**

```swift
// Get ID token with force refresh
func getIDToken(forceRefresh: Bool = false) async throws -> String {
    guard let user = Auth.auth().currentUser else { 
        throw AuthError.userNotFound 
    }
    return try await user.getIDToken(forcingRefresh: forceRefresh)
}

// Get ID token result (includes claims)
func getIDTokenResult() async throws -> AuthTokenResult {
    guard let user = Auth.auth().currentUser else { 
        throw AuthError.userNotFound 
    }
    return try await user.getIDTokenResult()
}
```

## Complete Usage Example

Here's how to use all these properties in a comprehensive user profile view:

```swift
import SwiftUI
import FirebaseAuth

struct UserProfileView: View {
    @StateObject private var userManager = UserManager()
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if let user = userManager.currentUser {
                    UserInfoCard(user: user)
                    UserActionsView(userManager: userManager)
                } else {
                    Text("No user signed in")
                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct UserInfoCard: View {
    let user: FirebaseUserModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("User Information")
                .font(.headline)
            
            InfoRow(label: "UID", value: user.uid)
            InfoRow(label: "Email", value: user.email ?? "Not provided")
            InfoRow(label: "Display Name", value: user.displayName ?? "Not set")
            InfoRow(label: "Phone", value: user.phoneNumber ?? "Not provided")
            InfoRow(label: "Email Verified", value: user.isEmailVerified ? "Yes" : "No")
            InfoRow(label: "Anonymous", value: user.isAnonymous ? "Yes" : "No")
            
            if let createdAt = user.createdAt {
                InfoRow(label: "Created", value: createdAt.formatted())
            }
            
            if let lastSignIn = user.lastSignInDate {
                InfoRow(label: "Last Sign In", value: lastSignIn.formatted())
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label + ":")
                .fontWeight(.medium)
            Spacer()
            Text(value)
                .foregroundColor(.secondary)
        }
    }
}

struct UserActionsView: View {
    @ObservedObject var userManager: UserManager
    
    var body: some View {
        VStack(spacing: 15) {
            Button("Send Email Verification") {
                Task {
                    try await userManager.sendEmailVerification()
                }
            }
            .buttonStyle(.bordered)
            
            Button("Sign Out") {
                try? userManager.signOut()
            }
            .buttonStyle(.borderedProminent)
            
            Button("Delete Account", role: .destructive) {
                Task {
                    try await userManager.deleteAccount()
                }
            }
            .buttonStyle(.bordered)
        }
    }
}
```

## Error Handling

Always handle potential errors when working with Firebase User properties:

```swift
enum AuthError: Error {
    case userNotFound
    case emailNotVerified
    case weakPassword
    case invalidEmail
    
    var localizedDescription: String {
        switch self {
        case .userNotFound:
            return "No user is currently signed in"
        case .emailNotVerified:
            return "Please verify your email address"
        case .weakPassword:
            return "Password is too weak"
        case .invalidEmail:
            return "Invalid email address"
        }
    }
}
```

## Custom User Properties

You can extend the Firebase User model with custom properties stored in Firestore:

```swift
struct ExtendedUserModel {
    // Firebase properties
    let firebaseUser: FirebaseUserModel
    
    // Custom properties (stored in Firestore)
    var username: String?
    var bio: String?
    var location: String?
    var preferences: UserPreferences?
    var followers: [String] = []
    var following: [String] = []
}

struct UserPreferences: Codable {
    var notifications: Bool = true
    var privacyMode: Bool = false
    var theme: String = "light"
}
```

## Security Rules Integration

Use Firebase User properties in Firestore security rules:

```javascript
// firestore.rules
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can only access their own documents
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Only verified users can write to certain collections
    match /verified_content/{document} {
      allow read: if true;
      allow write: if request.auth != null && request.auth.token.email_verified == true;
    }
  }
}
```

## Best Practices

1. **Always check for null values** - Most Firebase User properties are optional
2. **Handle authentication state changes** - Use StateDidChangeListener
3. **Refresh user data** - Call `reload()` after profile updates
4. **Store additional data in Firestore** - Firebase User has limited custom fields
5. **Implement proper error handling** - Network issues and auth errors are common
6. **Use tokens securely** - Never log or expose ID tokens
7. **Verify email addresses** - Check `isEmailVerified` for important operations

This documentation covers all the major Firebase User properties and methods available in iOS/SwiftUI applications. The updated code in your project now properly utilizes these properties for a complete authentication system. 