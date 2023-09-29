//
//  PopularDestinationsView.swift
//  TravelDiscovery
//
//  Created by joe on 2023/09/24.
//

import SwiftUI
import MapKit

struct PopularDestinationsView: View {
    let destinations = [
        Destination(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.855014, longitude: 2.341231),
        Destination(name: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.67988, longitude: 139.7695),
        Destination(name: "New York", country: "USA", imageName: "new_york", latitude: 40.71592, longitude: -74.0055)
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
    
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.859565, longitude: 2.353235), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    @State private var region: MKCoordinateRegion
    
    init(destination: Destination) {
        self.destination = destination
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: destination.latitude, longitude: destination.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        navigationBarInitialization()
    }
    
    var body: some View {
        ScrollView {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
            
            VStack(alignment: .leading) {
                Text(destination.name)
                    .font(.system(size: 19, weight: .bold))
                Text(destination.country)
                    .padding(.bottom, 5)
                
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    .padding(.top, 4)
                    .font(.system(size: 17))
                
                HStack { Spacer() }
            }
            .padding(.horizontal)
            
            HStack {
                Text("Location")
                    .font(.system(size: 19, weight: .semibold))
                Spacer()
            }
            .padding(.horizontal)
            
            Map(coordinateRegion: $region)
                .frame(height: 200)
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
//            PopularDestinationDetailsView(destination: Destination(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
            PopularDestinationDetailsView(destination: Destination(name: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.679693, longitude: 139.771913))
        }
        DiscoverView()
        PopularDestinationsView()
    }
}
