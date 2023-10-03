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
    
    @State private var region: MKCoordinateRegion
    @State private var isShowingAttractions = true
    
    init(destination: Destination) {
        self.destination = destination
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: destination.latitude, longitude: destination.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        navigationBarInitialization()
    }
    
    let imageUrlStrings = [
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e",
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702",
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/6982cc9d-3104-4a54-98d7-45ee5d117531"
    ]
    
    var body: some View {
        ScrollView {
//            DestinationHeaderContainer(imageNames: ["eiffel_tower", "art1", "art2"])
            DestinationHeaderContainer(imageUrlStrings: imageUrlStrings)
                .frame(height: 350)
            
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
                
                Button(action: { isShowingAttractions.toggle() }, label: {
                    Text("\(isShowingAttractions ? "Hide" : "Show") Attractions")
                        .font(.system(size: 13, weight: .semibold))
                })
                
                // UIKit: UISwitch
                Toggle("", isOn: $isShowingAttractions)
                    .labelsHidden()
            }
            .padding(.horizontal)
            
            Map(coordinateRegion: $region, annotationItems: isShowingAttractions ? attractions : []) { attraction in
//                MapMarker(coordinate: CLLocationCoordinate2D(latitude: attraction.latitude, longitude: attraction.longitude), tint: .red)
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: attraction.latitude, longitude: attraction.longitude)) {
                    CustomMapAnnotation(attraction: attraction)
                }
            }
            .frame(height: 300)
        }
        .navigationTitle(destination.name)
        .navigationBarTitleDisplayMode(.inline)
        .navBarInit()
    }
    
    let attractions = [
        Attraction(name: "Eiffel Tower", imageName: "eiffel_tower", latitude: 48.858605, longitude: 2.2946),
        Attraction(name: "Champs-Elysees", imageName: "new_york", latitude: 48.866867, longitude: 2.311780),
        Attraction(name: "Louvre Museum", imageName: "art2", latitude: 48.860288, longitude: 2.337789)
    ]
}

struct CustomMapAnnotation: View {
    let attraction: Attraction
    
    var body: some View {
        VStack(spacing: 5) {
            Image(attraction.imageName)
                .resizable()
                .frame(width: 80, height: 60)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(white:0, opacity: 0.5))
                )
            Text(attraction.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .background(LinearGradient(colors: [Color.red, Color.blue], startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(white:0, opacity: 0.5))
                )
        }
        .shadow(radius: 5)
    }
}

struct Attraction: Identifiable {
    let id = UUID().uuidString
    
    let name, imageName: String
    let latitude, longitude: Double
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
        .asTile()
    }
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PopularDestinationDetailsView(destination: Destination(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
//            PopularDestinationDetailsView(destination: Destination(name: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.679693, longitude: 139.771913))
        }
        DiscoverView()
        PopularDestinationsView()
    }
}
