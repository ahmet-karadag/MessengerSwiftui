//
//  User.swift
//  Messenger
//
//  Created by ahmet karadağ on 26.12.2024.
//

import Foundation
import FirebaseFirestore

struct User: Codable, Identifiable, Hashable {
  //  var id = NSUUID().uuidString eski yöntem.
    //var id = UUID().uuidString
    @DocumentID var uid: String?
    let fullName: String
    let email: String
    var profileImageUrl: String?
    
    var id: String {
     return uid ?? NSUUID().uuidString
    }
}
extension User {
    static let fakeUser = User(fullName: "spiderman", email: "spider@gmail.com", profileImageUrl: "spiderman")
    
}
