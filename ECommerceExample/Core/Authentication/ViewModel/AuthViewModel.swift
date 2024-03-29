//
//  AuthViewModel.swift
//  ECommerceExample
//
//  Created by Vladislav on 29.01.2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthFormProtocol {
    var formIsValid: Bool {get}
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var hello: String = "ASDASDASDASDASD"
    
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        print("Signing in...")
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("Failed to login due to error \(error)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        print("Creating new user...")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullName, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            
            await fetchUser()
        } catch {
            print("Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        print("Signing Out...")
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("Failed to sign out with error \(error)")
        }
    }
    
    func deleteAccount() {
        print("Deleting Account..")
    }
    
    func fetchUser() async {
        print("Fetching user...")
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {
            return
        }
        self.currentUser = try? snapshot.data(as: User.self)
        print("Current user is \(self.currentUser)")
    }
}
