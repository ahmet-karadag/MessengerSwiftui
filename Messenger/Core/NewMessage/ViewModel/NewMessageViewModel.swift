//
//  NewMessageViewModel.swift
//  Messenger
//
//  Created by ahmet karadağ on 27.01.2025.
//

import Foundation
import Firebase
import FirebaseAuth

@MainActor
class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init () {
        Task{
            try await fetchUsers()
        }
    }
    func fetchUsers()async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return
        }
        let users = try await UserService.fetchAllUsers()
        self.users = users.filter { $0.uid != currentUid }
    }
}
