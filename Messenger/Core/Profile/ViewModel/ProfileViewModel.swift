//
//  ProfileViewModel.swift
//  Messenger
//
//  Created by ahmet karadağ on 25.12.2024.
//

import Foundation
import PhotosUI
import SwiftUI


@MainActor
class ProfileViewModel: ObservableObject {
    
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task {
                try await loadProfileImage()
            }
        }
    }
    @Published var profileImage: Image?
    
    func loadProfileImage() async throws {
        guard let item = self.selectedItem else { return }
        guard let imagedata = try await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: imagedata) else { return }
        
        DispatchQueue.main.async {
             self.profileImage = Image(uiImage: uiImage)
        }
    }
}
