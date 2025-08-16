//
//  FavoritesRepository.swift
//  Azyk
//
//  Created by Шермат Эшеров on 15/8/25.
//

import Foundation

// MARK: - Notifications
extension Notification.Name {
    static let favoritesDidChange = Notification.Name("favoritesDidChange")
}

protocol FavoritesRepositoryProtocol {
    func getFavorites() -> [Restaurant]
    func addToFavorites(_ restaurant: Restaurant)
    func removeFromFavorites(_ restaurant: Restaurant)
    func isFavorite(_ restaurant: Restaurant) -> Bool
    func toggleFavorite(_ restaurant: Restaurant)
    func clearAllFavorites()
}

class FavoritesRepository: FavoritesRepositoryProtocol, ObservableObject {
    static let shared = FavoritesRepository()
    
    @Published var favorites: [Restaurant] = []
    
    private init() {
        // Load favorites from UserDefaults or other storage
        loadFavorites()
    }
    
    func getFavorites() -> [Restaurant] {
        return favorites
    }
    
    func addToFavorites(_ restaurant: Restaurant) {
        if !favorites.contains(where: { $0.id == restaurant.id }) {
            var updatedRestaurant = restaurant
            updatedRestaurant.isFavorite = true
            favorites.append(updatedRestaurant)
            saveFavorites()
            notifyFavoritesChanged()
        }
    }
    
    func removeFromFavorites(_ restaurant: Restaurant) {
        favorites.removeAll { $0.id == restaurant.id }
        saveFavorites()
        notifyFavoritesChanged()
    }
    
    func isFavorite(_ restaurant: Restaurant) -> Bool {
        return favorites.contains { $0.id == restaurant.id }
    }
    
    func toggleFavorite(_ restaurant: Restaurant) {
        if isFavorite(restaurant) {
            removeFromFavorites(restaurant)
        } else {
            addToFavorites(restaurant)
        }
    }
    
    func clearAllFavorites() {
        favorites.removeAll()
        saveFavorites()
        notifyFavoritesChanged()
    }
    
    // MARK: - Private Methods
    
    private func saveFavorites() {
        // Save to UserDefaults or other persistent storage
        // For now, we'll just keep in memory
        // TODO: Implement persistent storage when needed
    }
    
    private func loadFavorites() {
        // Load from UserDefaults or other persistent storage
        // For now, we'll start with empty favorites
        // TODO: Implement persistent storage when needed
    }
    
    private func notifyFavoritesChanged() {
        NotificationCenter.default.post(name: .favoritesDidChange, object: nil)
    }
}
