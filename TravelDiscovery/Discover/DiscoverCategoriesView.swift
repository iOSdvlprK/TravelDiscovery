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
        Category(name: "Sport", imageName: "sportscourt.fill"),
        Category(name: "Live Events", imageName: "music.mic"),
        Category(name: "Food", imageName: "fork.knife.circle.fill"),
        Category(name: "History", imageName: "books.vertical.fill")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(categories, id: \.self) { category in
                    /*
                    NavigationLink(
                        destination: CategoryDetailsView(),
                        label: {
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
                    )
                    */
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
        .navigationDestination(for: Category.self) { _ in
            CategoryDetailsView()
        }
    }
}

struct ActivityIndicatorView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

struct Place: Decodable, Hashable {
    let name, thumbnail: String
}

class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places = [Place]()
    
    @Published var errorMessage = ""
    
    init() {
        // network code will happen here
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else { return }
        
        URLSession.shared.dataTask(with: url) { data, resp, err in
            // check resp statusCode and err
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                guard let data = data else { return }
                
                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch {
                    print("Failed to decode JSON:", error)
                    self.errorMessage = error.localizedDescription
                }
                
                self.isLoading = false
            }
        }.resume()
    }
}

struct CategoryDetailsView: View {
//    @State private var isLoading = false
    @ObservedObject var vm = CategoryDetailsViewModel()
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                VStack {
                    ActivityIndicatorView()
                    Text("Loading...")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding()
                .background(Color(white: 0.1, opacity: 0.8))
                .cornerRadius(8)
            } else {
                ZStack {
                    ScrollView {
                        Text(vm.errorMessage)
                        ForEach(vm.places, id: \.self) { place in
                            VStack(alignment: .leading, spacing: 0) {
                                Image("art1")
                                    .resizable()
                                    .scaledToFill()
                                Text(place.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding()
                            }
                            .asTile()
                            .padding()
                        }
                    }
                }
            }
        }
        .navigationTitle("Category")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.clear, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
//        ZStack {
//            Color.orange
//            DiscoverCategoriesView()
//        }
        NavigationStack {
            CategoryDetailsView()
        }
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
