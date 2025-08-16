//
//  HomeView.swift
//  AzykBox
//
//  Created by Шермат Эшеров on 28/7/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack() {
            VStack {
                MenuCollection()
                    .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                HStack {
                                    Text("Wola, Warzawa")
                                        .foregroundStyle(.gray)
                                    Image(systemName: "mappin.and.ellipse.circle")
                                        .foregroundStyle(.white)
                                        .padding(3)
                                        .background(Circle().fill(.orange))
                                }
                            }
                        }
                ParameterView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    HomeView()
}
