//
//  AuthService.swift
//  Messenger
//
//  Created by ahmet karadağ on 8.01.2025.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

//Login and signup function will be here.
class AuthService {
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init () {
        self.userSession = Auth.auth().currentUser
        Task {
            try await UserService.shared.fetchCurrentUser()
        }
        print("deneme: \(userSession?.uid)")
    }
    @MainActor
    func logIn(withEmail email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        }catch{
            print("Logout:  \(error.localizedDescription)")
        }
    }
    @MainActor
    func createUser(withEmail email: String, password: String,fullName: String) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(email: email, fullName: fullName, id: result.user.uid)//hata alırsam kontrol et burayı.
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
    private func uploadUserData(email: String, fullName: String, id: String) async throws{
        let user = User(fullName: fullName, email: email, profileImageUrl: nil)
        
        guard let encodeUser = try? Firestore.Encoder().encode(user) else {
            return
        }
        try await Firestore.firestore().collection("users").document(id).setData(encodeUser)
    }
}
