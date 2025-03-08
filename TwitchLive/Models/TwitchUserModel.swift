//
//  TwitchUserModel.swift
//  TwitchLive
//
//  Created by Mikey Crispin on 3/7/25.
//

import Foundation

struct TwitchUserModel: Codable {
  let id: String
  let login: String
  let display_name: String
  let profile_image_url: String
}

struct TwitchAPIResponse: Codable {
  let data: [TwitchUserModel]
}

class TwitchAPI {
  static let shared = TwitchAPI()
  
  func fetchUserInfo(username: String) async throws -> TwitchUserModel? {
    let url = URL(string: "https://api.twitch.tv/helix/users?login=\(username)")
    
    guard let url = url else {
      throw URLError(.badURL)
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("Your Client Id", forHTTPHeaderField: "Client-ID")
    request.addValue("Bearer your access token", forHTTPHeaderField: "Authorization")
    
    let (data, response) = try await URLSession.shared.data(for: request)
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
      throw URLError(.badServerResponse)
    }
    
    let result = try JSONDecoder().decode(TwitchAPIResponse.self, from: data)
    return result.data.first
  }
}
