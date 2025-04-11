//
//  CircleImage.swift
//  TwitchLive
//
//  Created by Mikey Crispin on 2/24/25.
//

import SwiftUI

struct CircleImage: View {
  let userUrl: String?
  
  var body: some View {
    if let userUrl = userUrl, let imageUrl = URL(string: userUrl) {
      AsyncImage(url: imageUrl) { image in
        image
      } placeholder: {
        ProgressView()
      }
      // clipShape removes outside of circle
        .clipShape(Circle())
      // overlay adds the black outline
        .overlay {
          Circle().stroke(.black, lineWidth: 4)
        }
        .scaleEffect(0.85)
    }
  }
}

#Preview {
  CircleImage(userUrl: "https://static-cdn.jtvnw.net/jtv_user_pictures/a51cd646-7568-47cd-977b-121e54564a64-profile_image-300x300.png")
}
