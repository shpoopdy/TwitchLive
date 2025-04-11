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
  @State private var navigateToUserView = false
  
  var body: some View {
    NavigationStack {
      ZStack {
        AppColors.primary.ignoresSafeArea(edges: .all)
        
        VStack {
          Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.black)
            .padding(.bottom, 42)
            .foregroundStyle(AppColors.secondary)
          
          VStack(spacing: 16) {
            InputFieldView(data: $username, title: "Username")
          }
            .padding(.bottom, 16)
            .foregroundStyle(.white)
          
          Button (action: {
            Task {
              do {
                let user = try await TwitchAPI.shared.fetchUserInfo(username: username)
                if let user = user {
                  self.userInfo = user
                  self.navigateToUserView = true
                } else {
                  print("No user found.")
                }
              } catch {
                print("Error fetching user info: \(error.localizedDescription)")
              }
            }
          }, label: {
            Text("Search")
              .fontWeight(.heavy)
              .font(.title3)
              .frame(maxWidth: .infinity)
              .padding()
              .foregroundStyle(.white)
              .background(LinearGradient(gradient: Gradient(colors: [AppColors.accent, AppColors.secondary]),
                                         startPoint: .leading, endPoint: .trailing))
              .cornerRadius(40)
            
          })
          .navigationDestination(isPresented: $navigateToUserView) {
            UserView(user: userInfo)
          }
        }
        .padding()
      }
      
      
    }
    
  }
}

#Preview {
  ContentView()
}
