//
//  FiltredOption.swift
//  AzykBox
//
//  Created by Шермат Эшеров on 3/8/25.
//

import SwiftUI

struct FiltredOption: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
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
        .navigationBarBackButtonHidden(true)
        .toolbar {
           ToolbarItem(placement: .navigationBarLeading) {
               Button(action: {
                   print("TAPPED!")
                   dismiss()
               }) {
                   Image(systemName: "chevron.left")
                       .foregroundStyle(.black)
               }
           }
           ToolbarItem(placement: .principal) {
               Text("Closes Restaurants")
                   .font(.headline)
           }
       }
       .toolbarBackground(.white, for: .navigationBar)
    }
}

#Preview {
    FiltredOption()
}
