//
//  HomeView.swift
//  AzykBox
//
//  Created by Шермат Эшеров on 27/7/25.
//

import SwiftUI

struct RestaurantViews: View {

    var body: some View {
        List {
            ForEach(0..<10) { item in
                FoodViewCell()
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    RestaurantViews()
}
