//
//  UserService.swift
//  Messenger
//
//  Created by ahmet karadağ on 25.01.2025.
//

import Foundation
import Firebase
import FirebaseAuth

class UserService {
    @Published var currentUser: User?
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser() async throws{
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("DEBUG: Current user fetched successfully! \(currentUser)")
    }
   
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        
       return snapshot.documents.compactMap { try? $0.data(as: User.self) }
    }
}
