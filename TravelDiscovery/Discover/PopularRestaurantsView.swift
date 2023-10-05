//
//  PopularRestaurantsView.swift
//  TravelDiscovery
//
//  Created by joe on 2023/09/24.
//

import SwiftUI

struct PopularRestaurantsView: View {
    let restaurants = [
        Restaurant(name: "Japan's Finest Tapas", imageName: "tapas"),
        Restaurant(name: "Bar & Grill", imageName: "bar_grill")
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular places to eat")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(restaurants, id: \.self) { restaurant in
                        NavigationLink(value: restaurant, label: {
                            RestaurantTile(restaurant: restaurant)
                                .foregroundColor(Color(.label))
                        })
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationDestination(for: Restaurant.self) { restaurant in
            RestaurantDetailsView(restaurant: restaurant)
        }
    }
}

struct RestaurantTile: View {
    let restaurant: Restaurant
    
    var body: some View {
        HStack(spacing: 8) {
            Image(restaurant.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(5)
                .padding(.leading, 6)
                .padding(.vertical, 6)
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(restaurant.name)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.gray)
                    }
                }
                
                HStack {
                    Image(systemName: "star.fill")
                    Text("4.7 • Sushi • $$")
                }
                
                Text("Tokyo, Japan")
            }
            .font(.system(size: 12, weight: .semibold))
            
            Spacer()
        }
        .frame(width: 240)
//                        .modifier(TileModifier())
        .asTile()
        .padding(.bottom)
    }
}

struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularRestaurantsView()
        DiscoverView()
    }
}
