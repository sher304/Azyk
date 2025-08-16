//
//  DetaiRestaurantlView.swift
//  AzykBox
//
//  Created by Шермат Эшеров on 4/8/25.
//

import SwiftUI

struct RestaurantDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showSheet = false
    @State private var isFavorite: Bool
    
    let restaurant: Restaurant
    private let favoritesRepository = FavoritesRepository.shared

    init(restaurant: Restaurant) {
        self.restaurant = restaurant
        self._isFavorite = State(initialValue: FavoritesRepository.shared.isFavorite(restaurant))
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {
                    // Top section with image, logo, and title
                    ZStack(alignment: .bottomLeading) {
                        Image("foodbg")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .background(.blue)
                        Rectangle()
                            .foregroundStyle(.black)
                            .opacity(0.4)
                        
                        HStack(spacing: 6) {
                            Image(systemName: "graduationcap.circle")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundStyle(.white)
                            Text(restaurant.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
 
                    // Box name, price info
                    HStack {
                        Text(restaurant.menu.first?.name ?? "")
                            .font(.headline)
                        Spacer()
                        Text(restaurant.oldPrice.description)
                            .strikethrough()
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    
                    // Rating, price
                    HStack {
                        Label("\(String(format: "%.1f", restaurant.rating)) ★", systemImage: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Spacer()
                        
                        Text(restaurant.newPrice.description)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                    .padding(.horizontal)
                    
                    // Collecting Time
                    HStack {
                        Text("Collecting Time:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("18:00 - 20:00")
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    // Address
                    HStack(spacing: 25) {
                        Image(systemName: "location.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 24, height: 24)
                            .padding(.leading, 7)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Address")
                                .font(.headline)
                            Text(restaurant.address)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    Divider()
                    
                    // Description
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Description")
                            .font(.headline)
                        Text(restaurant.menu.first?.description ?? "")
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    // Reserve Button
                    Button(action: {
                        showSheet = true
                    }) {
                        Text("Reserve Now")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    .padding()
                    .sheet(isPresented: $showSheet) {
                        BagInformView()
                            .presentationDetents([.fraction(0.5), .medium]) 
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .ignoresSafeArea(.container, edges: .top)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.hidden, for: .navigationBar)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(Circle().fill(.black.opacity(0.4)))
                }
            }
            
            // Share and Favorite buttons on the right
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    // Share action
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(Circle().fill(.black.opacity(0.4)))
                }

                Button(action: {
                    toggleFavorite()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "suit.heart")
                        .foregroundStyle(isFavorite ? .red : .white)
                        .padding(10)
                        .background(Circle().fill(.black.opacity(0.4)))
                }
            }
        }
        .toolbarBackground(.white, for: .navigationBar)
        .onAppear {
            updateFavoriteState()
        }
        .onReceive(NotificationCenter.default.publisher(for: .favoritesDidChange)) { _ in
            updateFavoriteState()
        }
    }
    
    // MARK: - Private Methods
    
    private func toggleFavorite() {
        favoritesRepository.toggleFavorite(restaurant)
        isFavorite.toggle()
    }
    
    private func updateFavoriteState() {
        isFavorite = favoritesRepository.isFavorite(restaurant)
    }
}

#Preview {
    RestaurantDetailView(restaurant: Restaurant(name: "Green Leaf Cafe",
                                cuisine: "Vegetarian & Vegan",
                                rating: 4.2,
                                address: "45 Chuy Avenue, Bishkek",
                                isOpen: false,
                                imageName: "restaurant2",
                                menu: [
                                    MenuItem(name: "Vegan Burger", price: 300, description: "Plant-based patty with fresh vegetables."),
                                    MenuItem(name: "Quinoa Salad", price: 250, description: "Healthy mix of quinoa, avocado, and greens."),
                                    MenuItem(name: "Fruit Smoothie", price: 150, description: "Seasonal fruits blended with almond milk.")
                                ], oldPrice: 25,
                                                newPrice: 20, isFavorite: false))
}
