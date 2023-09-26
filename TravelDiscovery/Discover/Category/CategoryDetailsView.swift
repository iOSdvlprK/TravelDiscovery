//
//  CategoryDetailsView.swift
//  TravelDiscovery
//
//  Created by joe on 2023/09/26.
//

import SwiftUI
import Kingfisher
import SDWebImageSwiftUI

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
//                                KFImage(URL(string: place.thumbnail))
                                WebImage(url: URL(string: place.thumbnail))
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

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CategoryDetailsView()            
        }
    }
}
