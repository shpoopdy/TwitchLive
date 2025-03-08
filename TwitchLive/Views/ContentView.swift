//
//  ContentView.swift
//  TwitchLive
//
//  Created by Mikey Crispin on 2/24/25.
//

import SwiftUI

struct ContentView: View {
  @State private var username = ""
  @State private var userInfo: TwitchUserModel?
  
  var body: some View {
    VStack {
      Text("Welcome!")
        .font(.largeTitle)
        .fontWeight(.black)
        .padding(.bottom, 42)
      
      VStack(spacing: 16) {
        InputFieldView(data: $username, title: "Username")
      }.padding(.bottom, 16)
      
      Button (action: {
        Task {
          do {
            let user = try await TwitchAPI.shared.fetchUserInfo(username: username)
            if let user = user {
              self.userInfo = user
              print("User ID: \(user.id), Display Name: \(user.display_name), Login: \(user.login), Profile Image URL: \(user.profile_image_url)")
            } else {
              print("No user found.")
            }
          } catch {
            print("Error fetching user info: \(error.localizedDescription)")
          }
        }
      }, label: {
        Text("Sign In")
          .fontWeight(.heavy)
          .font(.title3)
          .frame(maxWidth: .infinity)
          .padding()
          .foregroundStyle(.white)
          .background(LinearGradient(gradient: Gradient(colors: [.pink, .blue]),
                                     startPoint: .leading, endPoint: .trailing))
          .cornerRadius(40)
        
      })
      
      HStack {
        Spacer()
        Text("Forgotten Password?")
          .fontWeight(.thin)
          .foregroundColor(Color.blue)
          .underline()
      }
      .padding(.top, 16)
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
