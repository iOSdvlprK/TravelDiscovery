//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by joe on 2023/09/24.
//

import SwiftUI

struct DiscoverCategoriesView: View {
    let categories: [Category] = [
        Category(name: "Art", imageName: "paintpalette.fill"),
        Category(name: "Sports", imageName: "sportscourt.fill"),
        Category(name: "Live Events", imageName: "music.mic"),
        Category(name: "Food", imageName: "fork.knife.circle.fill"),
        Category(name: "History", imageName: "books.vertical.fill")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(categories, id: \.self) { category in
                    NavigationLink(value: category) {
                        VStack(spacing: 8) {
                            Image(systemName: category.imageName)
                                .font(.system(size: 25))
                                .foregroundColor(Color(UIColor(red: 240/255, green: 147/255, blue: 80/255, alpha: 1)))
                                .frame(width: 64, height: 64)
                                .background(Color.white)
                                .cornerRadius(.infinity)
                            
                            Text(category.name)
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                        .frame(width: 68)
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationDestination(for: Category.self) { category in
            CategoryDetailsView(name: category.name)
        }
    }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
//        ZStack {
//            Color.orange
//            DiscoverCategoriesView()
//        }
        DiscoverView()
        /*
        NavigationView {
            NavigationLink(
                destination: Text("Destination"),
                label: {
                    Text("Link")
                }
            )
        }
        */
    }
}
