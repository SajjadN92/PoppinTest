//
//  PartyCardViewModel.swift
//  Poppin Test
//
//  Created by Sajjad on 12/4/23.
//

import Foundation

struct PartyCardViewModel {
    let name: String
    let dateString: String
    let priceString: String
    let imageURL: URL
    let amountGoing: Int
    let amountGoingString: String

    init(party: Party) {
        name = party.name
        priceString = party.price.getPriceString()
        imageURL = party.imageURL
        amountGoingString = "\(party.amountGoing) Attendees"

        var dateString = party.startDate.getString()
        if let endDate = party.endDate {
            if endDate.isSameDay(as: party.startDate) {
                dateString.append(" - \(endDate.getTimeString())")
            } else {
                dateString.append(" - \(endDate.getString())")
            }
        }
        self.dateString = dateString
        self.amountGoing = party.amountGoing
    }
}
