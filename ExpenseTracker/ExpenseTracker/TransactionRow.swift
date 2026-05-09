//
//  TransactionRow.swift
//  ExpenseTracker
//

import SwiftUI

struct TransactionRow: View {
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20) {
            // MARK: Transaction Category Icon
            RoundedRectangle(cornerRadius: 20)
                .fill(.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    Image(systemName: "desktopcomputer")
                        .font(Font.system(size: 20))
                        .foregroundStyle(.icon)
                }
            
            VStack(alignment: .leading, spacing: 6) {
                // MARK: Transaction Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // MARK: Transaction Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                // MARK: Transaction Date
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            // MARK: Transaction Amount
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                .foregroundStyle(transaction.type == TransactionType.credit ? .text : .primary)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    TransactionRow(transaction: transactionPreviewData)
}
