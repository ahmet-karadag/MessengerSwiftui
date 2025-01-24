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
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init () {
        self.userSession = Auth.auth().currentUser
        print("deneme: \(userSession?.uid)")
    }
    func logIn(withEmail email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        }catch{
            print("Logout:  \(error.localizedDescription)")
        }
    }
    func createUser(withEmail email: String, password: String,fullName: String) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        }catch {
            print("User: \(error.localizedDescription)")
        }
       
    }
    func signOut(){
        do{
            try Auth.auth().signOut()//firebase kullanıcı çıkışı yapan fonksiyon.
            self.userSession = nil
        }catch {
            print("Logout:  \(error.localizedDescription)")
        }
        
    }
}
