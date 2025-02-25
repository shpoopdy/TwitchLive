//
//  ContentView.swift
//  TwitchLive
//
//  Created by Mikey Crispin on 2/24/25.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Button (action: {
        print("You pressed me!")
      }, label: {
        Text("Sign In")
      })
      .padding()
      
      Button (action: {
        print("You pressed me!!!")
      }, label: {
        Text("Sign Up")
      })
    }
  }
}

#Preview {
  ContentView()
}
