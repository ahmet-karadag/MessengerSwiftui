//
//  ContentView.swift
//  Messenger
//
//  Created by ahmet karadağ on 5.12.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentVM = ContentViewModel()
    var body: some View {
       //eğer giriş yapılmışsa mesajlar gösterir değilse giriş sayfasına yönlendirir.
        Group {
            if contentVM.userSession != nil {
                InboxView()
            }else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
