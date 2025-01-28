//
//  InboxView.swift
//  Messenger
//
//  Created by ahmet karadağ on 22.12.2024.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
   // @State private var user = User.fakeUser
    @StateObject var inboxVM = InboxViewModel()
    @State private var selectedUser: User?
    @State private var showChat = false
    
    private var user: User? {
      return inboxVM.currentUser
    }
    var body: some View {
        NavigationStack {
            ScrollView{
                ActiveView()
                
                List{
                    ForEach (0...10, id: \.self){ messages in
                        InboxRowView()
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 120)
            }.onChange(of: selectedUser, perform: { newValue in
                showChat = newValue != nil
            })
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationDestination(isPresented: $showChat, destination: {
                if let user = selectedUser {
                    ChatView(user: user)
                }
            })
            
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView(selectedUser: $selectedUser)
            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        NavigationLink(value: user) {
                            CircularProfileImageView(user: user, size: .xSmall)
                        }
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showNewMessageView.toggle()
                    }label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 34, height: 34)
                            .foregroundStyle(.black,Color(.systemGray4))
                    }
                }
            }
        }
    }
}

#Preview {
    InboxView()
}
