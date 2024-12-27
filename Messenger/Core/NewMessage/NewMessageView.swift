//
//  NewMessageView.swift
//  Messenger
//
//  Created by ahmet karadağ on 24.12.2024.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
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
                
                ForEach (0 ... 10, id: \.self){ user in
                    
                    HStack {
                        CircularProfileImageView(user: User.fakeUser, size: .medium)
                        Text("Spiderman")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.leading)
                    Divider()
                        .padding(.leading,35)
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
    NewMessageView()
}
