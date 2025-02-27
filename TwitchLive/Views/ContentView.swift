//
//  ContentView.swift
//  TwitchLive
//
//  Created by Mikey Crispin on 2/24/25.
//

import SwiftUI

struct ContentView: View {
  @State private var username = ""
  @State private var password = ""
  
  var body: some View {
    VStack {
      Text("Welcome!")
        .font(.largeTitle)
        .fontWeight(.black)
        .padding(.bottom, 42)
      
      VStack(spacing: 16) {
        InputFieldView(data: $username, title: "Username")
        
        InputFieldView(data: $password, title: "Password")
      }.padding(.bottom, 16)
      
      Button (action: {
        print("You pressed me!")
      }, label: {
        Text("Sign In")
          .fontWeight(.heavy)
          .font(.title3)
          .frame(maxWidth: .infinity)
          .padding()
          .foregroundStyle(.white)
          .background(LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .leading, endPoint: .trailing))
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
