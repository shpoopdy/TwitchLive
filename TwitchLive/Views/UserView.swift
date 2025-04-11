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
      AppColors.accent.ignoresSafeArea()
      
      VStack {
        Spacer()
        if let user = user {
          CircleImage(userUrl: user.profile_image_url)
            .offset(y: -5)
          
          Text("Hi, \(user.display_name)!")
            .font(.title)
          Spacer()
          VStack(alignment: .leading) {
            HStack {
              Text("Display Name: ")
                .font(.title2)
              Spacer()
              Text(user.display_name)
            }
            HStack {
              Text("Account created: ")
                .font(.title2)
              Spacer()
              Text(formattedDate(from: user.created_at))
              
            }
          }
          .padding()
          Spacer()
        }
      }
      .foregroundStyle(.white)
      .background(Rectangle()
        .foregroundStyle(AppColors.primary)
        .cornerRadius(15)
        .shadow(radius: 7))
      .aspectRatio(contentMode: .fit)
      .padding()
    }
  }
}

func formattedDate(from isoDate: String) -> String {
    let isoFormatter = ISO8601DateFormatter()
    isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

    if let date = isoFormatter.date(from: isoDate) {
        let displayFormatter = DateFormatter()
        displayFormatter.dateStyle = .long
        displayFormatter.timeStyle = .none
        return displayFormatter.string(from: date)
    } else {
        // Try again without fractional seconds
        isoFormatter.formatOptions = [.withInternetDateTime]
        if let fallbackDate = isoFormatter.date(from: isoDate) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateStyle = .long
            displayFormatter.timeStyle = .none
            return displayFormatter.string(from: fallbackDate)
        }
        return "Unknown"
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
