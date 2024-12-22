//
//  LoginView.swift
//  Messenger
//
//  Created by ahmet karadağ on 5.12.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationStack {
            
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
                    
                    SecureField("Password", text: $password)
                        .font(.subheadline)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal,20)
                }
                Button {
                    
                }label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing,25)
                }.frame(maxWidth: .infinity,alignment: .trailing)
                
                Button{
                    
                }label: {
                    Text("Login")
                        .fontWeight(.semibold)
                        .font(.subheadline)
                        .frame(width: 300,height: 30)
                        .foregroundStyle(.white)
                        .background(Color(.systemBlue))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.vertical)
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width * 0.5)-45, height: 0.8)
                    Text("Or")
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width * 0.5)-45, height: 0.8)
                }.foregroundStyle(.black)
                
                HStack{
                    Image("facebook")
                        .resizable()
                        .frame(width: 25,height: 25)
                    Text("Login with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemBlue))
                }
                .padding(.top,10)
                Spacer()
                
                Divider()
                NavigationLink{
                    RegisterView()
                        //.navigationBarBackButtonHidden()
                } label:{
                    HStack{
                        Text("dont have an account?")
                            .fontWeight(.semibold)
                        Text("Signup")
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    LoginView()
}
