//
//  MessageService.swift
//  Messenger
//
//  Created by ahmet karadağ on 28.01.2025.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct MessageService{
    
    static let messagesCollection = Firestore.firestore().collection("messages")
    //chat leştiğimiz kişi mesajları.
    static func sendMessage(_ messageText: String, toUser user: User) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let chatPartnerId = user.uid
        
        let currentUserRef = messagesCollection.document(currentUid).collection(chatPartnerId ?? "").document()//veritabanı referancımız.
        let chatPartnerRef = messagesCollection.document(chatPartnerId ?? "").collection(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let message = Message(messageId: messageId,
                              fromId: currentUid,
                              toId: chatPartnerId ?? "",
                              messageText: messageText,
                              timestamp: Timestamp())
        
        guard let messageData = try? Firestore.Encoder().encode(message) else { return }
        
        currentUserRef.setData(messageData)
        chatPartnerRef.document(messageId).setData(messageData)
    }
    //mesajları çekme işlemi
    static func observeMessages(chatPartner: User,completion: @escaping ([Message]) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let chatPartnerId = chatPartner.id
        let query = messagesCollection.document(currentUid).collection(chatPartnerId).order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            var messages = changes.compactMap({try? $0.document.data(as: Message.self) })//gelen mesajları mesaj nesnesine dönüştürür.
            
            for (index,message) in messages.enumerated() where !message.isFromCurrentUser{
                messages[index].user = chatPartner
            }
            completion(messages)
        }
    }
}
