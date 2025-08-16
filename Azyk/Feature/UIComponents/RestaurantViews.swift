//
//  HomeView.swift
//  AzykBox
//
//  Created by Шермат Эшеров on 27/7/25.
//

import SwiftUI

struct RestaurantViews: View {
    let restaurants: [Restaurant]
    let onFavoriteToggle: ((Restaurant) -> Void)?

    init(restaurants: [Restaurant], onFavoriteToggle: ((Restaurant) -> Void)? = nil) {
        self.restaurants = restaurants
        self.onFavoriteToggle = onFavoriteToggle
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Favorites")
                .fontWeight(.bold)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
            LazyVStack(spacing: 15) {
                ForEach(restaurants, id: \.id) { restaurant in
                    NavigationLink {
                        RestaurantDetailView(restaurant: restaurant)
                    } label: {
                        FoodViewCell(
                            restaurant: restaurant,
                            onFavoriteToggle: onFavoriteToggle
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    RestaurantViews(restaurants: [Restaurant(name: "Green Leaf Cafe",
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
                                             newPrice: 20, isFavorite: false)])
}
