//
//  FoodViewCell.swift
//  AzykBox
//
//  Created by Шермат Эшеров on 27/7/25.
//

import SwiftUI

struct FoodViewCell: View {
    @State private var isFavorited = false

    
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
                
                // MARK: Copmonents inside image
                VStack {
                    // MARK: Icons from top
                    HStack(alignment: .bottom) {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        Spacer()
                        Image(systemName: isFavorited ? "heart.fill" : "heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .onTapGesture {
                                self.isFavorited.toggle()
                            }
                    }
                    Spacer()
                    // MARK: Icon of restaurant and title of the restaurant
                    HStack {
                        Image(systemName: "graduationcap.circle")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Text("Starbucks Coffee")
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
                Text("Title of the meal")
                    .fontWeight(.bold)
                Text("Pick up date and time 17:00")
                Text("18.00 som")
                    .strikethrough(true, color: .gray)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                HStack {
                    Image(systemName: "star.square")
                    Text("4.1")
                    Text("|")
                    Text("1 km")
                    Spacer()
                    Text("13.00 som")
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
    FoodViewCell()
}
