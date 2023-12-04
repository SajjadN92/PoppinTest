//
//  PartyRepository.swift
//  Poppin Test
//
//  Created by Sajjad on 12/3/23.
//

import Foundation

protocol PartyRepositoryProtocol {
    func getParties() -> [Party]
    func getParties(by searchString: String) -> [Party]
    func addRandomParty()
}

final class PartyRepository: PartyRepositoryProtocol {

    private let localStore: PartyLocalStoreProtocol

    init(localStore: PartyLocalStoreProtocol) {
        self.localStore = localStore
    }

    func getParties() -> [Party] {
        return localStore.getParties()
    }

    func getParties(by searchString: String) -> [Party] {
        let parties = localStore.getParties()
        return parties.filter { $0.name.lowercased().contains(searchString.lowercased()) }
    }

    func addRandomParty() {
        localStore.addParty(Party.randomParty())
    }
}
