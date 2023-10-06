//
//  RestaurantPhotosView.swift
//  TravelDiscovery
//
//  Created by joe on 2023/10/06.
//

import SwiftUI

struct RestaurantPhotosView: View {
    init() {
        navigationBarInitialization()
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.fixed(130), spacing: 0),
                GridItem(.fixed(130), spacing: 0),
                GridItem(.fixed(130))
            ], spacing: 5, content: {
                ForEach(0..<15, id:\.self) { num in
                    Text("Placeholder")
                        .padding()
                        .background(Color.red)
                }
            })
        }
        .navigationTitle("All Photos")
        .navigationBarTitleDisplayMode(.inline)
        .navBarInit()
    }
}

struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RestaurantPhotosView()
        }
//        .previewLayout(.fixed(width: 1000, height: 400))
    }
}
