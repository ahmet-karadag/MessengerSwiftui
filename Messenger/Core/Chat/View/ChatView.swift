//
//  ChatView.swift
//  Messenger
//
//  Created by ahmet karadağ on 27.12.2024.
//

import SwiftUI

struct ChatView: View {
   // @State private var messageText = ""
    @StateObject var chatVM: ChatViewModel
    let user: User//chat yaparken seçtiğimiz kullanıcını mesaj kutusuna gider
    
    init(user: User) {
        self.user = user
        self._chatVM = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    var body: some View {
        ScrollView {
            VStack {
                CircularProfileImageView(user: user, size: .large)
                VStack(spacing: 8){
                    Text(user.fullName)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text("Messenger")
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundStyle(Color(.systemGray))
                }
            }
            //messages
            ForEach(chatVM.messages) { message in
                ChatMessageCell(message: message)
            }
        }
        Spacer()
        ZStack(alignment: .trailing) {
            TextField("Type your message...", text: $chatVM.messageText,axis: .vertical)
                .padding(12)
                .background(Color(.systemGroupedBackground))
                //.padding(.trailing, 5)
                .clipShape(Capsule())
                .font(.subheadline)
               
            Button {
               //  print("send message")
                chatVM.sendMessage()
                chatVM.messageText = ""
            } label: {
                Text("send")
                    .fontWeight(.semibold)
            }.padding(.horizontal)

        }.padding()
    }
}

#Preview {
    ChatView(user: User.fakeUser)
}
