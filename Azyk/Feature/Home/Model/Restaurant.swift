//
//  Restaurant.swift
//  Azyk
//
//  Created by Шермат Эшеров on 15/8/25.
//

import Foundation

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let cuisine: String
    let rating: Double
    let address: String
    let isOpen: Bool
    let imageName: String
    let menu: [MenuItem]
    let oldPrice: Int
    let newPrice: Int
    var isFavorite: Bool
    
    mutating func toggleFavorite() {
        isFavorite.toggle()
    }
}

struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let description: String
}
