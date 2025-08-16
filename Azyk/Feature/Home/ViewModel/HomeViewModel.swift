//
//  HomeViewModel.swift
//  Azyk
//
//  Created by Шермат Эшеров on 15/8/25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var mockRestaurants: [Restaurant] = [
        Restaurant(
            name: "AzykBox Diner",
            cuisine: "Kyrgyz & European",
            rating: 4.5,
            address: "123 Ala-Too Street, Bishkek",
            isOpen: true,
            imageName: "restaurant1",
            menu: [
                MenuItem(name: "Beshbarmak", price: 350, description: "Traditional Kyrgyz dish with boiled meat and noodles."),
                MenuItem(name: "Lagman", price: 280, description: "Hand-pulled noodles in rich broth with beef and vegetables."),
                MenuItem(name: "Manty", price: 200, description: "Steamed dumplings with juicy minced meat filling.")
            ], oldPrice: 25,
            newPrice: 20, isFavorite: false
        ),
        Restaurant(
            name: "Green Leaf Cafe",
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
            newPrice: 20, isFavorite: false
        ),
        Restaurant(
            name: "Bella Italia",
            cuisine: "Italian",
            rating: 4.8,
            address: "78 Manas Street, Bishkek",
            isOpen: true,
            imageName: "restaurant3",
            menu: [
                MenuItem(name: "Margherita Pizza", price: 400, description: "Classic pizza with mozzarella and tomato sauce."),
                MenuItem(name: "Carbonara Pasta", price: 380, description: "Creamy pasta with pancetta and parmesan."),
                MenuItem(name: "Tiramisu", price: 220, description: "Coffee-flavored Italian dessert.")
            ], oldPrice: 25,
            newPrice: 20, isFavorite: true
        )
    ]
    
    private let favoritesRepository = FavoritesRepository.shared
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        setupFavoritesObserver()
        setupNotificationObserver()
        syncFavoritesState()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Setup
    
    private func setupFavoritesObserver() {
        // Observe changes from the shared favorites repository
        favoritesRepository.$favorites
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.syncFavoritesState()
            }
            .store(in: &cancellables)
    }
    
    private func setupNotificationObserver() {
        // Listen for favorites change notifications
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(favoritesDidChange),
            name: .favoritesDidChange,
            object: nil
        )
    }
    
    @objc private func favoritesDidChange() {
        DispatchQueue.main.async { [weak self] in
            self?.syncFavoritesState()
        }
    }
    
    private func syncFavoritesState() {
        // Update the favorite status of restaurants based on shared repository
        for (index, restaurant) in mockRestaurants.enumerated() {
            let isFavorite = favoritesRepository.isFavorite(restaurant)
            if mockRestaurants[index].isFavorite != isFavorite {
                mockRestaurants[index].isFavorite = isFavorite
            }
        }
    }
    
    // MARK: - Favorites Management
    
    func toggleFavorite(for restaurant: Restaurant) {
        favoritesRepository.toggleFavorite(restaurant)
    }
    
    func getFavoriteRestaurants() -> [Restaurant] {
        return mockRestaurants.filter { $0.isFavorite }
    }
    
    func isFavorite(_ restaurant: Restaurant) -> Bool {
        return favoritesRepository.isFavorite(restaurant)
    }
    
    // MARK: - Search and Filtering
    
    func searchRestaurants(query: String) -> [Restaurant] {
        if query.isEmpty {
            return mockRestaurants
        }
        return mockRestaurants.filter { restaurant in
            restaurant.name.localizedCaseInsensitiveContains(query) ||
            restaurant.cuisine.localizedCaseInsensitiveContains(query) ||
            restaurant.address.localizedCaseInsensitiveContains(query)
        }
    }
    
    func filterByCuisine(_ cuisine: String) -> [Restaurant] {
        if cuisine.isEmpty {
            return mockRestaurants
        }
        return mockRestaurants.filter { $0.cuisine == cuisine }
    }
    
    func filterByRating(minRating: Double) -> [Restaurant] {
        return mockRestaurants.filter { $0.rating >= minRating }
    }
    
    func filterByPriceRange(minPrice: Int, maxPrice: Int) -> [Restaurant] {
        return mockRestaurants.filter { restaurant in
            restaurant.newPrice >= minPrice && restaurant.newPrice <= maxPrice
        }
    }
}
