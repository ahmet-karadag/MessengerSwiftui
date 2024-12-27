//
//  ChatView.swift
//  Messenger
//
//  Created by ahmet karadağ on 27.12.2024.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    var body: some View {
        ScrollView {
            VStack {
                CircularProfileImageView(user: User.fakeUser, size: .large)
                VStack(spacing: 8){
                    Text("spiderman")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text("Messenger")
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundStyle(Color(.systemGray))
                }
            }
            ForEach(0 ... 10, id: \.self) { message in
                ChatMessageCell(isFromCurrentUser: Bool.random())
            }
        }
        Spacer()
        ZStack(alignment: .trailing) {
            TextField("Type your message...", text: $messageText,axis: .vertical)
                .padding(12)
                .background(Color(.systemGroupedBackground))
                //.padding(.trailing, 5)
                .clipShape(Capsule())
                .font(.subheadline)
               
            Button {
                 print("")
            } label: {
                Text("send")
                    .fontWeight(.semibold)
            }.padding(.horizontal)

        }.padding()
    }
}

#Preview {
    ChatView()
}
