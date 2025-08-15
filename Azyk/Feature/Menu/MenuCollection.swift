//
//  MenuCollection.swift
//  AzykBox
//
//  Created by Шермат Эшеров on 28/7/25.
//

import SwiftUI

struct MenuCollection: View {
    let categories = ["All", "Fast Food", "Coffee", "Bakery", "Vegan", "Drinks"]
        
        @State private var selectedCategory: String = "All"
        
        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                            .fontWeight(selectedCategory == category ? .bold : .regular)
                            .foregroundColor(selectedCategory == category ? .white : .black)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 8)
                            .background(selectedCategory == category ? Color.blue : Color.gray.opacity(0.2))
                            .cornerRadius(15)
                            .onTapGesture {
                                selectedCategory = category
                            }
                            .animation(.easeInOut(duration: 0.2), value: selectedCategory)
                    }
                }
                .padding(.horizontal)
            }
        }
}

#Preview {
    MenuCollection()
}
