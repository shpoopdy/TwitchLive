//
//  CircleImage.swift
//  TwitchLive
//
//  Created by Mikey Crispin on 2/24/25.
//

import SwiftUI

struct CircleImage: View {
  var body: some View {
    Image("spraynardKruger")
    // clipShape removes outside of circle
      .clipShape(Circle())
    // overlay adds the black outline
      .overlay {
        Circle().stroke(.black, lineWidth: 4)
      }
      .scaleEffect(0.65)
  }
}

#Preview {
  CircleImage()
}
