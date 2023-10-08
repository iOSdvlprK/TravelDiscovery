//
//  UserDetailsView.swift
//  TravelDiscovery
//
//  Created by joe on 2023/10/08.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Image(user.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    .padding(.top)
                
                Text(user.name)
                    .font(.system(size: 15, weight: .semibold))
                
                HStack {
                    // Opt + 8: •
                    Text("@amyadams20 •")
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.system(size: 11, weight: .semibold))
                    Text("2541")
                }
                .font(.system(size: 13, weight: .regular))
                
                Text("YouTuber, Vlogger, Travel Creator")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(.lightGray))
                
                HStack(spacing: 12) {
                    VStack {
                        Text("59,394")
                            .font(.system(size: 14, weight: .semibold))
                        Text("Followers")
                            .font(.system(size: 10, weight: .regular))
                    }
                    
                    Spacer()
                        .frame(width: 0.5, height: 12)
                        .background(Color(.lightGray))
                    
                    VStack {
                        Text("2,112")
                            .font(.system(size: 14, weight: .semibold))
                        Text("Following")
                            .font(.system(size: 10, weight: .regular))
                    }
                }
                
                HStack(spacing: 12) {
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text("Follow")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color.orange)
                        .cornerRadius(.infinity)
                    })
                    
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text("Contact")
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color(white: 0.9))
                        .cornerRadius(.infinity)
                    })
                }
                .font(.system(size: 12, weight: .semibold))
                
                ForEach(0..<10, id: \.self) { num in
                    HStack {
                        Spacer()
                    }
                    .frame(height: 200)
                    .background(Color(white: 0.8))
                    .cornerRadius(12)
                    .shadow(color: Color(white: 0.8), radius: 5, x: 0, y: 4)
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            UserDetailsView(user: User(name: "Amy Adams", imageName: "amy"))
        }
    }
}
