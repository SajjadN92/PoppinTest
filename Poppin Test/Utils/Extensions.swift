//
//  Extensions.swift
//  Poppin Test
//
//  Created by Sajjad on 12/4/23.
//

import Foundation

extension Date {

    func getString() -> String {
        let dateFormatter = DateFormatter()
        if Calendar.current.isDateInToday(self) {
            dateFormatter.dateFormat = "'Today', hh:mm a"
        } else if Calendar.current.isDateInTomorrow(self) {
            dateFormatter.dateFormat = "'Tomorrow', hh:mm a"
        } else {
            dateFormatter.dateFormat = "E, MMM d, hh:mm a"
        }
        return dateFormatter.string(from: self)
    }

    func getTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: self)
    }

    func isSameDay(as date: Date) -> Bool {
        let calendar = Calendar.current
        let fromComponents = calendar.dateComponents([.year, .month, .day], from: self)
        let toComponents = calendar.dateComponents([.year, .month, .day], from: date)

        return fromComponents.year == toComponents.year &&
               fromComponents.month == toComponents.month &&
               fromComponents.day == toComponents.day
    }
}

extension Double {
    func getPriceString() -> String {
        return formatted(.currency(code: "USD"))
    }
}
