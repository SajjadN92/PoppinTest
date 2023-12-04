//
//  PartyLocalStore.swift
//  Poppin Test
//
//  Created by Sajjad on 12/3/23.
//

import Foundation

protocol PartyLocalStoreProtocol: LocalStoreProtocol {
    func getParties() -> [Party]
    func addParty(_ party: Party)
}

final class PartyLocalStore: PartyLocalStoreProtocol {

    private var parties: [Party] = [Party.randomParty(), Party.randomParty(), Party.randomParty()]

    func getParties() -> [Party] {
        return parties
    }

    func addParty(_ party: Party) {
        parties.insert(party, at: 0)
    }
}
