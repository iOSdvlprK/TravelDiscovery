//
//  UserDetailsView.swift
//  TravelDiscovery
//
//  Created by joe on 2023/10/08.
//

import SwiftUI
import Kingfisher

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
                    VStack(alignment: .leading) {
//                        Image("art2")
                        KFImage(URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/6982cc9d-3104-4a54-98d7-45ee5d117531"))
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                        
                        HStack {
                            Image("amy")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 34)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("Here is my post title")
                                    .font(.system(size: 13, weight: .semibold))
                                
                                Text("500k views")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal, 8)
                        
                        HStack {
                            ForEach(0..<3, id: \.self) { num in
                                Text("#Traveling")
                                    .foregroundColor(Color(red: 7/255, green: 126/255, blue: 254/255))
                                    .font(.system(size: 14, weight: .semibold))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 4)
                                    .background(Color(red: 232/255, green: 237/255, blue: 251/255, opacity: 1))
                                    .cornerRadius(20)
                            }
                        }
                        .padding(.bottom)
                        .padding(.horizontal, 8)
                    }
                    .background(Color(white: 1))
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
