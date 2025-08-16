//
//  FavoriteView.swift
//  AzykBox
//
//  Created by Шермат Эшеров on 29/7/25.
//

import SwiftUI

struct FavoriteView: View {
    @StateObject private var viewModel = FavoritesViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading favorites...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if viewModel.hasFavorites {
                    RestaurantViews(
                        restaurants: viewModel.favorites,
                        onFavoriteToggle: { restaurant in
                            viewModel.toggleFavorite(restaurant)
                        }
                    )
                    .padding(.horizontal)
                } else {
                    emptyStateView
                }
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                if viewModel.hasFavorites {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Clear All") {
                            viewModel.clearAllFavorites()
                        }
                        .foregroundColor(.red)
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadFavorites()
        }
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 20) {
            Image(systemName: "heart.slash")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            
            Text("No Favorites Yet")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Start adding restaurants to your favorites to see them here!")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Button("Explore Restaurants") {
                // Navigate to home or search
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    FavoriteView()
}
