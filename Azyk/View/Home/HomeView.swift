//
//  HomeView.swift
//  AzykBox
//
//  Created by Шермат Эшеров on 28/7/25.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack() {
            VStack {
                MenuCollection()
                ParameterView()
            }
        }
    }
}

#Preview {
    HomeView()
}
