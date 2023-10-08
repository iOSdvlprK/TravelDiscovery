//
//  TrendingCreatorsView.swift
//  TravelDiscovery
//
//  Created by joe on 2023/09/24.
//

import SwiftUI

struct TrendingCreatorsView: View {
    let users = [
        User(name: "Amy Adams", imageName: "amy"),
        User(name: "Billy", imageName: "billy"),
        User(name: "Sam Smith", imageName: "sam")
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Trending Creators")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(users, id: \.self) { user in
                        NavigationLink(value: user, label: {
                            DiscoverUserView(user: user)
                        })
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .navigationDestination(for: User.self, destination: { user in
            UserDetailsView(user: user)
        })
    }
}

struct DiscoverUserView: View {
    let user: User
    
    var body: some View {
        VStack {
            Image(user.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .cornerRadius(.infinity)
            Text(user.name)
                .font(.system(size: 11, weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.label))
        }
        .frame(width: 60)
        .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
    }
}

struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
