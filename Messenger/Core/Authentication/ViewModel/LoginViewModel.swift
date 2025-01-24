//
//  LoginViewModel.swift
//  Messenger
//
//  Created by ahmet karadağ on 8.01.2025.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.logIn(withEmail: email, password: password)
    }
}
