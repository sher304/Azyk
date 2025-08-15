//
//  ProfileView.swift
//  AzykBox
//
//  Created by Шермат Эшеров on 29/7/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    
                    // MARK: - User Info
                    VStack(spacing: 6) {
                        Text("Shermat Esherov")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("shermat@example.com")
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                        
                        Button("Edit Profile") {
                            // Navigate to edit screen
                        }
                        .font(.subheadline)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                    }
                    .padding(.top, 40)
                    
                    // MARK: - Options
                    VStack(spacing: 1) {
                        ProfileOption(title: "My Orders", icon: "cart")
                        ProfileOption(title: "Settings", icon: "gear")
                        ProfileOption(title: "Help", icon: "questionmark.circle")
                        ProfileOption(title: "Terms & Conditions", icon: "doc.text")
                    }
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    // MARK: - Logout
                    Button(action: {
                        // Handle logout logic
                    }) {
                        Text("Log Out")
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
}

struct ProfileOption: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 24)
            Text(title)
                .foregroundColor(.primary)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
    }
}

