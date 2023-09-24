//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by joe on 2023/09/23.
//

import SwiftUI

struct ContentView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9882131219, green: 0.6823856831, blue: 0.2509839535, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5366613865, blue: 0.2347321808, alpha: 1))]), startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
                
                Color(UIColor(white: 0.95, alpha: 1))
                    .offset(y: 400)
                
                ScrollView {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go?")
                        Spacer()
                    }
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(white: 1, opacity: 0.3))
                    .cornerRadius(10)
                    .padding(16)
                    
                    DiscoverCategoriesView()
                    
                    VStack {
                        PopularDestinationsView()
                        PopularRestaurantsView()
                        TrendingCreatorsView()
                    }
                    .background(Color(UIColor(white: 0.95, alpha: 1)))
                    .cornerRadius(16)
                    .padding(.top, 32)
                }
            }
            .navigationTitle("Discover")
            // .navigationBarTitleDisplayMode(.inline)
            // .toolbarBackground(Color.clear, for: .navigationBar)
            // .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct Destination: Hashable {
    let name, country, imageName: String
}

struct PopularDestinationsView: View {
    let destinations = [
        Destination(name: "Paris", country: "France", imageName: "eiffel_tower"),
        Destination(name: "Tokyo", country: "Japan", imageName: "japan"),
        Destination(name: "New York", country: "USA", imageName: "new_york")
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular destinations")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(destinations, id: \.self) { destination in
                        VStack(alignment: .leading, spacing: 0) {
                            Image(destination.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 125, height: 125)
                                .cornerRadius(4)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 6)
                            
                            Text(destination.name)
                                .font(.system(size: 12, weight: .semibold))
                                .padding(.horizontal, 12)
                            
                            Text(destination.country)
                                .font(.system(size: 12, weight: .semibold))
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                                .foregroundColor(.gray)
                        }
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color(.sRGB, white: 0.8, opacity: 1), radius: 4, x: 0.0, y: 2)
                        .padding(.bottom)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct Restaurant: Hashable {
    let name, imageName: String
}

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
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color(.sRGB, white: 0.8, opacity: 1), radius: 4, x: 0.0, y: 2)
                        .padding(.bottom)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct User: Hashable {
    let name, imageName: String
}

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
                        VStack {
                            Image(user.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .cornerRadius(.infinity)
                            Text(user.name)
                                .font(.system(size: 11, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 60)
                        .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        .padding(.bottom)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Category: Hashable {
    let name, imageName: String
}

struct DiscoverCategoriesView: View {
    let categories: [Category] = [
        Category(name: "Art", imageName: "paintpalette.fill"),
        Category(name: "Sport", imageName: "sportscourt.fill"),
        Category(name: "Live Events", imageName: "music.mic"),
        Category(name: "Food", imageName: "fork.knife.circle.fill"),
        Category(name: "History", imageName: "books.vertical.fill")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(categories, id: \.self) { category in
                    VStack(spacing: 8) {
//                        Spacer()
                        Image(systemName: category.imageName)
                            .font(.system(size: 25))
                            .foregroundColor(Color(UIColor(red: 240/255, green: 147/255, blue: 80/255, alpha: 1)))
                            .frame(width: 64, height: 64)
                            .background(Color.white)
                            .cornerRadius(.infinity)
//                            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        Text(category.name)
                            .font(.system(size: 12, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .frame(width: 68)
                }
            }
            .padding(.horizontal)
        }
    }
}
