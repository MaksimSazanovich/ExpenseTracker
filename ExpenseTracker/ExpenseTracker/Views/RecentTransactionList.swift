//
//  RecentTransactionList.swift
//  ExpenseTracker
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListViewModel: TransactionListViewModel
    var body: some View {
        VStack {
            HStack {
                // MARK: Header Title
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                // MARK: Header Link
                NavigationLink {
                    TransactionList()
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(.text)
                }
            }
            .padding(.top)
            
            // MARK: Recent Trannsaction List
            ForEach(Array(transactionListViewModel.transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    let transactionListViewModel: TransactionListViewModel = {
        let viewModel = TransactionListViewModel()
        viewModel.transactions = transactionListPreviewData
        return viewModel
    }()
    
    RecentTransactionList()
        .environmentObject(transactionListViewModel)
}
