//
//  PreviewData.swift
//  ExpenseTracker
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "01/01/2020", institution: "BelarusBank", account: "Visa BelarusBank", merchant: "Apple", amount: 11.49, type: .debit, categoryId: 801, category: "Sowtware", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
