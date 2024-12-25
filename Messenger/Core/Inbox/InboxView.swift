//
//  InboxView.swift
//  Messenger
//
//  Created by ahmet karadağ on 22.12.2024.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
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
            }.fullScreenCover(isPresented: $showNewMessageView, content: {
               NewMessageView()
            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Image(systemName: "person.circle.fill")
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
