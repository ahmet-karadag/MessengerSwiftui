//
//  NewMessageView.swift
//  Messenger
//
//  Created by ahmet karadağ on 24.12.2024.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
    @StateObject private var newMessageVM = NewMessageViewModel()
    @Binding var selectedUser: User?
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ScrollView{
                TextField("Search", text: $searchText)
                    .padding()
                    .background(Color.secondary)
                    .cornerRadius(10)
                
                Text("Contacts")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .foregroundStyle(Color(.black))
                
                ForEach (newMessageVM.users){ user in
                    VStack {
                        
                    
                    HStack {
                        CircularProfileImageView(user: user, size: .medium)
                      //  Text("Spiderman")
                        Text(user.fullName)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.leading)
                    Divider()
                        .padding(.leading,35)
                    }.onTapGesture {
                        selectedUser = user
                        dismiss()
                    }
                }
            }
            .navigationTitle("new messages")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button("Close"){
                        dismiss()
                    }
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        NewMessageView(selectedUser: .constant(User.fakeUser))
    }
}
