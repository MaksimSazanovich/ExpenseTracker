//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListViewModel = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListViewModel)
        }
    }
}
