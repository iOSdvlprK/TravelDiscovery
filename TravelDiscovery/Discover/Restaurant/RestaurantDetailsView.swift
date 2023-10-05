//
//  RestaurantDetailsView.swift
//  TravelDiscovery
//
//  Created by joe on 2023/10/05.
//

import SwiftUI

struct RestaurantDetailsView: View {
    let restaurant: Restaurant
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
        navigationBarInitialization()
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                Image(restaurant.imageName)
                    .resizable()
                    .scaledToFill()
                
                LinearGradient(colors: [.clear, .black], startPoint: .center, endPoint: .bottom)
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.system(size: 19, weight: .bold))
                        
                        HStack {
                            ForEach(0..<5) { num in
                                Image(systemName: "star.fill")
                            }
                            .foregroundColor(.orange)
                        }
                    }
                    
                    Spacer()
                    
                    Text("See more photos")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(width: 80)
                        .multilineTextAlignment(.trailing)
                }
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Location & Description")
                    .font(.system(size: 17, weight: .bold))
                Text("Tokyo, Japan")
                
                HStack {
                    ForEach(0..<5) { num in
                        Image(systemName: "dollarsign.circle.fill")
                    }
                    .foregroundColor(.orange)
                }
                
                Text("Usually when you want to write a very long description, you want to make sure that it spans at least a few lines. When I'm testing I like to see at least 5 lines of text so that things are auto sized correctly. One more line of text should be better just to be safe.")
                    .padding(.top, 8)
                    .font(.system(size: 15, weight: .regular))
            }
            .padding()
            
            HStack {
                Text("Popular Dishes")
                    .font(.system(size: 17, weight: .bold))
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<5) { num in
                        VStack(alignment: .leading) {
                            Image("tapas")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 80)
                                .cornerRadius(5)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                                .shadow(radius: 2)
                                .padding(.vertical, 2)
                            Text("Japanese Tapas")
                                .font(.system(size: 15, weight: .bold))
                            Text("88 photos")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Restaurant Details")
        .navigationBarTitleDisplayMode(.inline)
        .navBarInit()
    }
}

struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RestaurantDetailsView(restaurant: Restaurant(name: "Japan's Finest Tapas", imageName: "tapas"))
        }
    }
}
