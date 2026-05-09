//
//  Extensions.swift
//  ExpenseTracker
//

import Foundation
import SwiftUI

extension DateFormatter {
    static let allNumericsUSA: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericsUSA.date(from: self) else { return Date() }
        return parsedDate
    }
}
