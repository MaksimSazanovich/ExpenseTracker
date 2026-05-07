//
//  TransactionModel.swift
//  ExpenseTracker
//

import Foundation

struct TransactionModel: Identifiable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    var amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    var isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}
