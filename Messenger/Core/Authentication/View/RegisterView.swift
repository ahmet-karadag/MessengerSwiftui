//
//  RegisterView.swift
//  Messenger
//
//  Created by ahmet karadağ on 18.12.2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullName: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Spacer()
            Image("messenger")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            
            VStack (spacing: 15){
                TextField("Email", text: $email)
                    .font(.subheadline)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal,20)
                TextField("Email", text: $fullName)
                    .font(.subheadline)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal,20)
                
                SecureField("Password", text: $password)
                    .font(.subheadline)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal,20)
            }
            Button{
                dismiss()
            }label: {
                Text("Sign Up")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .frame(width: 300,height: 30)
                    .foregroundStyle(.white)
                    .background(Color(.systemBlue))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.vertical)
            Spacer()
            Divider()
            Button{
             
            } label:{
                HStack{
                    Text("already have an account?")
                        .fontWeight(.semibold)
                    Text("Sign İn")
                }
                .font(.footnote)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    RegisterView()
}
