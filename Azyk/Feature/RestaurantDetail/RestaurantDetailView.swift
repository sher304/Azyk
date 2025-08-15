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

    
    var restaurantName: String = "Sultan Bistro"
    var boxName: String = "Kebab Box"
    var oldPrice: String = "$12.99"
    var newPrice: String = "$7.99"
    var rating: Double = 4.6
    var collectingTime: String = "18:00 - 20:00"
    var address: String = "Bishkek, Manas Ave 45"
    var description: String = "A delicious mix of grilled meats, vegetables, and rice. Perfect for a late dinner or takeaway meal."
    var overallRating: Double = 4.4

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
                            Text(restaurantName)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
 
                    // Box name, price info
                    HStack {
                        Text(boxName)
                            .font(.headline)
                        Spacer()
                        Text(oldPrice)
                            .strikethrough()
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    
                    // Rating, price
                    HStack {
                        Label("\(String(format: "%.1f", rating)) ★", systemImage: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Spacer()
                        
                        Text(newPrice)
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
                        Text(collectingTime)
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
                            Text(address)
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
                        Text(description)
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
                    // Favorite action
                }) {
                    Image(systemName: "suit.heart")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(Circle().fill(.black.opacity(0.4)))
                }
            }
        }
        .toolbarBackground(.white, for: .navigationBar)
    }
}

#Preview {
    RestaurantDetailView()
}
