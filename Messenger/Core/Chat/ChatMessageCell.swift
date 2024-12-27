//
//  ChatMessageCell.swift
//  Messenger
//
//  Created by ahmet karadağ on 27.12.2024.
//

import SwiftUI

struct ChatMessageCell: View {
    let isFromCurrentUser: Bool
    var body: some View {
       HStack {
           if isFromCurrentUser {
               Spacer()
              
               Text( "text message text message text message text message text message text message" )
                   .font(.subheadline)
                   .padding(12)
                   .background(Color(.systemBlue))
                   .foregroundStyle(.white)
                   .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                   .frame(maxWidth: UIScreen.main.bounds.width/1.5, alignment: .trailing)
           }else {
               HStack(alignment: .bottom, spacing: 8) {
                   CircularProfileImageView(user: User.fakeUser, size: .small)
                   Text( "text message" )
                       .font(.subheadline)
                       .padding()
                       .background(Color(.systemGray4))
                       .foregroundStyle(.black)
                       .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                       .frame(maxWidth: UIScreen.main.bounds.width/1.7, alignment: .leading)
                   Spacer()
               }
              
           }
        }
       .padding(.horizontal,8)
    }
}

#Preview {
    ChatMessageCell(isFromCurrentUser: false)
}
