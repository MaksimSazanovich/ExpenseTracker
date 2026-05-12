//
//  TransactionList.swift
//  ExpenseTracker
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListViewModel: TransactionListViewModel
    
    var body: some View {
        VStack {
            List {
                // MARK: Transacation Groups
                ForEach(Array(transactionListViewModel.groupTransactionByMonth()), id: \.key) { month, transactions in
                    Section {
                        // MARK: Transaction List
                        ForEach(transactions) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                    } header: {
                        // MARK: Transaction Month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)

                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let transactionListViewModel: TransactionListViewModel = {
        let viewModel = TransactionListViewModel()
        viewModel.transactions = transactionListPreviewData
        return viewModel
    }()
    
    NavigationView {
        TransactionList()
    }
    .environmentObject(transactionListViewModel)
    
}
