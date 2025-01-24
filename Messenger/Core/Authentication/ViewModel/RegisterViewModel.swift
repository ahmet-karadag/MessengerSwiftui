//
//  RegisterViewModel.swift
//  Messenger
//
//  Created by ahmet karadağ on 8.01.2025.
//

import Foundation
import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    
    func createUser()async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullName: fullName)
    }
}
