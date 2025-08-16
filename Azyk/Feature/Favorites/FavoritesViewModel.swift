//
//  FavoritesViewModel.swift
//  Azyk
//
//  Created by Шермат Эшеров on 15/8/25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class FavoritesViewModel: ObservableObject {
    @Published var favorites: [Restaurant] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let repository: FavoritesRepositoryProtocol
    private var cancellables: Set<AnyCancellable> = []
    
    init(repository: FavoritesRepositoryProtocol = FavoritesRepository.shared) {
        self.repository = repository
        setupObservers()
        loadFavorites()
    }
    
    // MARK: - Setup
    
    private func setupObservers() {
        // Observe changes from the shared repository
        if let sharedRepo = repository as? FavoritesRepository {
            sharedRepo.$favorites
                .receive(on: DispatchQueue.main)
                .sink { [weak self] updatedFavorites in
                    self?.favorites = updatedFavorites
                }
                .store(in: &cancellables)
        }
        
        // Listen for favorites change notifications
        NotificationCenter.default.publisher(for: .favoritesDidChange)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.loadFavorites()
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Public Methods
    
    func loadFavorites() {
        isLoading = true
        favorites = repository.getFavorites()
        isLoading = false
    }
    
    func addToFavorites(_ restaurant: Restaurant) {
        repository.addToFavorites(restaurant)
    }
    
    func removeFromFavorites(_ restaurant: Restaurant) {
        repository.removeFromFavorites(restaurant)
    }
    
    func toggleFavorite(_ restaurant: Restaurant) {
        repository.toggleFavorite(restaurant)
    }
    
    func isFavorite(_ restaurant: Restaurant) -> Bool {
        return repository.isFavorite(restaurant)
    }
    
    func clearAllFavorites() {
        repository.clearAllFavorites()
    }
    
    // MARK: - Computed Properties
    
    var hasFavorites: Bool {
        return !favorites.isEmpty
    }
    
    var favoritesCount: Int {
        return favorites.count
    }
}
