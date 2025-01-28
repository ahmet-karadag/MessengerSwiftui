//
//  ChatViewModel.swift
//  Messenger
//
//  Created by ahmet karadağ on 28.01.2025.
//

import Foundation


class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func sendMessage() {
        MessageService.sendMessage(messageText, toUser: user)
    }
}
