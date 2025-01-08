//
//  User.swift
//  Messenger
//
//  Created by ahmet karadağ on 26.12.2024.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
  //  var id = NSUUID().uuidString eski yöntem.
    var id = UUID().uuidString
    let fullName: String
    let email: String
    var profileImageUrl: String?
    
}
extension User {
    static let fakeUser = User(fullName: "spiderman", email: "spider@gmail.com", profileImageUrl: "spiderman")
    
}
