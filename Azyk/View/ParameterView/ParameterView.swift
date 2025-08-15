//
//  ParameterView.swift
//  AzykBox
//
//  Created by Шермат Эшеров on 28/7/25.
//

import SwiftUI

struct ParameterView: View {
    @Environment(\.dismiss) var dimsiss

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 25) {
                    ForEach(0..<5) { section in
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Category \(section)")
                                    .font(.headline)
                                Spacer()
                                NavigationLink {
                                    FiltredOption()
                                } label: {
                                    Text("See All")
                                        .font(.subheadline)
                                        .foregroundColor(.blue)
                                }
                            }
                            .padding(.horizontal)
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 15) {
                                    ForEach(0..<10) { item in
                                        NavigationLink {
                                            RestaurantDetailView()
                                        } label: {
                                            FoodViewCell()
                                                .frame(width: 300)
                                        }
                                    }
                                }
                                .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 5))
                            }
                        }
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    ParameterView()
}
