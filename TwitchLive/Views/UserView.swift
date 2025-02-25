//
//  UserView.swift
//  TwitchLive
//
//  Created by Mikey Crispin on 2/24/25.
//

import SwiftUI

struct UserView: View {
  var body: some View {
    CircleImage()
      .offset(y: 20)
    Text("Hi, Spraynard!")
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
