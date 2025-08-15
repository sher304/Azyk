//
//  FavoriteView.swift
//  AzykBox
//
//  Created by Шермат Эшеров on 29/7/25.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Favorites")
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding()
            RestaurantViews()
        }
    }
}

#Preview {
    FavoriteView()
}
