//
//  ActiveView.swift
//  Messenger
//
//  Created by ahmet karadağ on 23.12.2024.
//

import SwiftUI

struct ActiveView: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing: 33){
                ForEach(0...10, id: \.self){ user in
                    VStack{
                        ZStack(alignment: .bottomTrailing){
                            CircularProfileImageView(user: User.fakeUser, size: .large)
                            ZStack{
                                Circle()
                                    .fill(.white)
                                    .frame(width: 20,height: 20)
                                Circle()
                                    .fill(Color(.systemGreen))
                                    .frame(width: 13,height: 13)
                            }
                        }
                        Text("ahmet")
                    }
                }
            }
            .padding()
        }
        .frame(height: 100)
    }
}

#Preview {
    ActiveView()
}
