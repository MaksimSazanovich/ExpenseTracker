//
//  ContentView.swift
//  ExpenseTracker
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListViewModel: TransactionListViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    // MARK: Chart
                    let data = transactionListViewModel.accumulateTransactions()
                    
                    if !data.isEmpty {
                        
                        let totalExpenses = data.last?.1 ?? 0
                        CardView {
                            VStack(alignment: .leading) {
                                ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                                
                                LineChart()
                            }
                            .background(Color(.systemBackground))
                        }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color(.systemBackground), foregroundColor: ColorGradient(.icon.opacity(0.4), .icon)))
                        .frame(height: 300)
                        
                    }
                    
                    // MARK: Transaction List
                    RecentTransactionList()
                    
                }
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
    let transactionListViewModel: TransactionListViewModel = {
        let viewModel = TransactionListViewModel()
        viewModel.transactions = transactionListPreviewData
        return viewModel
    }()
    
    ContentView()
        .environmentObject(transactionListViewModel)
}
