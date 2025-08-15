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
            RestaurantViews()
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
