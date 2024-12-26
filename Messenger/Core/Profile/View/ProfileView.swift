//
//  ProfileView.swift
//  Messenger
//
//  Created by ahmet karadağ on 25.12.2024.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    let user: User
    var body: some View {
        VStack{
            PhotosPicker(selection: $viewModel.selectedItem) {
                if let profileImage = viewModel.profileImage {
                    profileImage
                        .resizable()
                        .frame(width: 90,height: 90)
                        .scaledToFill()
                        .clipShape(Circle())
                }else {
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .scaledToFill()
                }
            }
            Text(user.fullName)
                .font(.title3)
                .fontWeight(.semibold)
        }
        
        List{
            Section{
                ForEach (SettingsOptionViewModel.allCases, id: \.self){ options in
                    HStack{
                        Image(systemName: options.imageName)
                            .resizable()
                            .foregroundStyle(options.backgroundColor)
                            .frame(width: 20,height: 20)
                        Text(options.title)
                            .font(.subheadline)
                            
                    }
                }
            }
            Section {
                Button("Logout"){
                    
                }
                Button("Delete Account"){
                    
                }
            }
            .foregroundStyle(.red)
        }
    }
}

#Preview {
    ProfileView(user: User.fakeUser)
}
