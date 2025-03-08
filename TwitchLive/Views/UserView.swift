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
    CircleImage()
      .offset(y: 20)
    
    if let user = user {
      Text("Hi, \(user.display_name)!")
      Text(user.id)
      Text(user.login)
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
