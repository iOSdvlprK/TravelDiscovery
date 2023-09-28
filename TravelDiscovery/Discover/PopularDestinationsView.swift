//
//  PopularDestinationsView.swift
//  TravelDiscovery
//
//  Created by joe on 2023/09/24.
//

import SwiftUI

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
                        NavigationLink(value: destination) {
                            PopularDestinationTile(destination: destination)
                                .padding(.bottom)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationDestination(for: Destination.self) { destination in
            PopularDestinationDetailsView(destination: destination)
        }
    }
}

struct PopularDestinationDetailsView: View {
    let destination: Destination
    
    init(destination: Destination) {
        self.destination = destination
        navigationBarInitialization()
    }
    
    var body: some View {
        ScrollView {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
            VStack(alignment: .leading) {
                Text(destination.name)
                    .font(.system(size: 18, weight: .bold))
                Text(destination.country)
                
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }
                .padding(.top, 1)
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    .padding(.top, 4)
                
                HStack { Spacer() }
            }
            .padding(.horizontal)
        }
        .navigationTitle(destination.name)
        .navigationBarTitleDisplayMode(.inline)
        .navBarInit()
    }
}

struct PopularDestinationTile: View {
    let destination: Destination
    
    var body: some View {
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
                .foregroundColor(Color(.label))
            
            Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
                .foregroundColor(.gray)
        }
//                        .modifier(TileModifier())
        .asTile()
    }
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PopularDestinationDetailsView(destination: Destination(name: "Paris", country: "France", imageName: "eiffel_tower"))
        }
        DiscoverView()
        PopularDestinationsView()
    }
}
