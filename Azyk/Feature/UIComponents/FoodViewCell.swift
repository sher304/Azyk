//
//  FoodViewCell.swift
//  AzykBox
//
//  Created by Шермат Эшеров on 27/7/25.
//

import SwiftUI

struct FoodViewCell: View {
    let restaurant: Restaurant
    let onFavoriteToggle: ((Restaurant) -> Void)?
    
    init(restaurant: Restaurant, onFavoriteToggle: ((Restaurant) -> Void)? = nil) {
        self.restaurant = restaurant
        self.onFavoriteToggle = onFavoriteToggle
    }
    
    var body: some View {
        VStack {
            ZStack {
                Image("foodbg")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .background(.blue)
                Rectangle()
                    .foregroundStyle(.black)
                    .opacity(0.4)
                
                // MARK: Components inside image
                VStack {
                    // MARK: Icons from top
                    HStack(alignment: .bottom) {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        Spacer()
                        Button(action: {
                            onFavoriteToggle?(restaurant)
                        }) {
                            Image(systemName: restaurant.isFavorite ? "heart.fill" : "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundColor(restaurant.isFavorite ? .red : .white)
                        }
                    }
                    Spacer()
                    // MARK: Icon of restaurant and title of the restaurant
                    HStack {
                        Image(systemName: "graduationcap.circle")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Text(restaurant.name)
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
                .padding(EdgeInsets(top: 5, leading: 5,
                                    bottom: 5, trailing: 5))
                .frame(height: 100)
                .foregroundStyle(.white)
            }
            .frame(height: 100)
            .clipped()
            .background(.orange)
            
            // MARK: ContentView
            VStack(alignment: .leading) {
                Text(restaurant.address)
                    .fontWeight(.bold)
                Text("Pick up date and time 17:00")
                Text("\(restaurant.oldPrice) kgz")
                    .strikethrough(true, color: .gray)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                HStack {
                    Image(systemName: "star.square")
                    Text(restaurant.rating.description)
                    Text("|")
                    Text("1 km")
                    Spacer()
                    Text("\(restaurant.newPrice) som")
                        .foregroundStyle(.green)
                }
                .fontWeight(.bold)
            }
            .foregroundStyle(.black)
            .padding(EdgeInsets(top: 0, leading: 15,
                                bottom: 15, trailing: 15))
        }
         .background(.white)
         .cornerRadius(15)
         .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
    }
}

#Preview {
    FoodViewCell(restaurant: Restaurant(name: "Green Leaf Cafe",
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
