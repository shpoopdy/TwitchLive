//
//  UserView.swift
//  TwitchLive
//
//  Created by Mikey Crispin on 2/24/25.
//

import SwiftUI

struct UserView: View {
  var body: some View {
    VStack {
      Circle()
        .stroke(style: StrokeStyle(lineWidth: 1))
        .size(width: 250, height: 250)
        .offset(x: 75, y: 125)
      Text("Hi, Spraynard!")
    }
    
    Spacer()
    
    Button(action: {
      print("Super push!")
    }, label: {
      Text("Following")
    })
  }
}

#Preview {
  UserView()
}
