//
//  InboxRowView.swift
//  Messenger
//
//  Created by ahmet karadağ on 23.12.2024.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing:10){
            CircularProfileImageView(user: User.fakeUser, size: .large)
            
            VStack(alignment: .leading, spacing: 5){
                Text("Ahmet Karadağ")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text("Hello how are you my friend")
                    .font(.subheadline)
                    .foregroundColor(Color(.systemGray))
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100,alignment: .leading)
            }
            HStack{
                Text("Monday")
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundStyle(.black)
        }
        .frame(height: 75)
        //.background(Color(.systemRed))
    }
}

#Preview {
    InboxRowView()
}
