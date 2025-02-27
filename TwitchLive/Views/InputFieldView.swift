//
//  InputFieldView.swift
//  TwitchLive
//
//  Created by Mikey Crispin on 2/27/25.
//

import SwiftUI

struct InputFieldView: View {
  @Binding var data: String
  var title: String?
  
    var body: some View {
      ZStack {
        TextField("", text: $data)
          .padding(.horizontal, 10)
          .frame(height: 42)
        // This overlay creates the border around our field
          .overlay(
            RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
              .stroke(Color.gray, lineWidth: 1)
          )
        
        // This HStack allows me to push the text all the way to the left, then style it to appear
        // as though it is sitting on top of the rectangle, style points.
        HStack {
          Text(title ?? "Input")
            .font(.headline)
            .fontWeight(.thin)
            .foregroundStyle(Color.gray)
            .multilineTextAlignment(.leading)
            .padding(4)
            .background(.white)
          Spacer()
        }
        .padding(.leading, 8)
        .offset(CGSize(width: 0, height: -20))
      }.padding(4)
    }
}

#Preview {
  // Don't forget to add the follow so you can see it update live. Needed the Previewable for
  // inline State use.
  @Previewable @State var data: String = ""
  InputFieldView(data: $data, title: "Password")
}
