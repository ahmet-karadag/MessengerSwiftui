//
//  CircularProfileImageView.swift
//  Messenger
//
//  Created by ahmet karadağ on 27.12.2024.
//

import SwiftUI

struct CircularProfileImageView: View {
    let user : User
    let size: ProfileImageSize
    var body: some View {
        if let imageUrl = user.profileImageUrl {
            Image(imageUrl)
                .resizable()
                .frame(width:size.dimension, height: size.dimension)
                .clipShape(Circle())
                .shadow(radius: 10)
        }else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width:size.dimension, height: size.dimension)
                .foregroundStyle(Color(.systemGray3))
                
        }
    }
}

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
            case .xSmall: return 34
        case .small: return 40
        case .medium: return 54
        case .large: return 64
        case .xLarge: return 80
        }
    }
}



#Preview {
    CircularProfileImageView(user: User.fakeUser, size: .xLarge)
}
