//
//  TransactionModel.swift
//  ExpenseTracker
//

import Foundation

struct Transaction: Identifiable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    var amount: Double
    let type: TransactionType
    var categoryId: Int
    var category: String
    var isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var dateParsed: Date {
        return date.dateParsed()
    }
    
    var signedAmount: Double {
        return type == .credit ? amount : -amount
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}
