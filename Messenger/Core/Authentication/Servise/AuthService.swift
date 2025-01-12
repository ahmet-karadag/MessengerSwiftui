//
//  AuthService.swift
//  Messenger
//
//  Created by ahmet karadağ on 8.01.2025.
//

import Foundation
import Firebase
import FirebaseAuth

//Login and signup function will be here.
class AuthService {
    
    
    func logIn(withEmail email: String, password: String) async throws {
        print("kayit: \(email)")
        print("kayit: \(password)")
    }
    func createUser(withEmail email: String, password: String,fullName: String) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("User: \(result.user.uid)")
        }catch {
            print("User: \(error.localizedDescription)")
        }
       
    }
}
