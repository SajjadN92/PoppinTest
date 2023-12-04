//
//  Party.swift
//  Poppin Test
//
//  Created by Sajjad on 12/3/23.
//

import Foundation

struct Party: Identifiable {
    let id = UUID().uuidString
    let amountGoing: Int
    let name: String
    let imageURL: URL
    let price: Double
    let startDate: Date
    let endDate: Date?

    // Generate a random party
    static func randomParty() -> Party {
        let partyNames = [
            "Celestial Soirée",
            "Midnight Masquerade",
            "Fiesta Fantástica",
            "Glam Gala",
            "Neon Nights",
            "Enchanted Elegance",
            "Retro Rendezvous",
            "Safari Soirée",
            "Ocean Odyssey",
            "Carnival Carnival",
            "Moonlit Mixer",
            "Tropical Twilight",
            "Electric Eclectic",
            "Mystic Mingle",
            "Starlight Soak",
            "Polaris Party",
            "Sunset Serenade",
            "Galactic Gathering",
            "Frosty Fête",
            "Aurora Affair"
        ]
        let imageNames = (1...8).compactMap { "party-\($0)" }
        let amountGoing = Int.random(in: 0...40)
        let randomName = partyNames.randomElement()!
        let randomImageURL = Bundle.main.url(forResource: imageNames.randomElement()!, withExtension: "jpg")!
        let randomPrice = Double.random(in: 10.0...100.0)
        /// 86400 : 1 day in seconds
        let randomStartDate = Date().addingTimeInterval(Double.random(in: 0.0...86400))
        /// 18000 : 5 hours in seconds
        let randomEndDate = Bool.random() ? nil : randomStartDate.addingTimeInterval(Double.random(in: 1...18000))
        return Party(
            amountGoing: amountGoing, 
            name: randomName,
            imageURL: randomImageURL,
            price: randomPrice,
            startDate: randomStartDate,
            endDate: randomEndDate
        )
    }
}
