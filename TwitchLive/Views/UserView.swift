//
//  UserView.swift
//  TwitchLive
//
//  Created by Mikey Crispin on 2/24/25.
//

import SwiftUI

struct UserView: View {
  var user: TwitchUserModel?
  
  var body: some View {
    
    ZStack {
      AppColors.primary.ignoresSafeArea()
      VStack {
        if let user = user {
          CircleImage(userUrl: user.profile_image_url)
            .offset(y: 20)
          
          Text("Hi, \(user.display_name)!")
            .font(.title)
          Text(user.id)
          Text("Account created: \(user.created_at)")
            .font(.title2)
        }
        Spacer()
      }
      .foregroundStyle(.white)
    }
  }
}

#Preview {
  UserView(user: TwitchUserModel(
    id: "123456",
    login: "Mikey",
    display_name: "Mikey",
    profile_image_url: "https://static-cdn.jtvnw.net/jtv_user_pictures/a51cd646-7568-47cd-977b-121e54564a64-profile_image-300x300.png",
    created_at: "December"))
}
