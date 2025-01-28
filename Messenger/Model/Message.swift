//
//  Message.swift
//  Messenger
//
//  Created by ahmet karadağ on 28.01.2025.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

struct Message: Identifiable, Codable, Hashable {
    @DocumentID var messageId: String?
    let fromId: String//bu kişiden
    let toId: String//diğer kişiye
    let messageText: String
    let timestamp: Timestamp
    
    var user: User?
    
    var id: String {
        return messageId ?? NSUUID().uuidString
    }
    var chatPartnerId: String {
        return fromId == Auth.auth().currentUser!.uid ? toId : fromId
    }
    var isFromCurrentUser: Bool {
        return fromId == Auth.auth().currentUser!.uid
    }
}

