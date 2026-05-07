//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Maksim on 7.05.26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Notification Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}
