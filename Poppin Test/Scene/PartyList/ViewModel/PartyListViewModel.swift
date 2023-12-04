//
//  PartyListViewModel.swift
//  Poppin Test
//
//  Created by Sajjad on 12/3/23.
//

import Combine

final class PartyListViewModel: ViewModel {

    private let repository: PartyRepositoryProtocol
    private let stateSubject: CurrentValueSubject<PartyList.State, Never>
    var state: PartyList.State {
        stateSubject.value
    }
    var statePublisher: AnyPublisher<PartyList.State, Never> {
        stateSubject.eraseToAnyPublisher()
    }

    init(
        stateSubject: CurrentValueSubject<PartyList.State, Never>,
        repository: PartyRepositoryProtocol
    ) {
        self.stateSubject = stateSubject
        self.repository = repository
    }

    func handle(action: PartyList.Action) {
        switch action {
        case .plusButtonTapped:
            repository.addRandomParty()
            stateSubject.value.update {
                $0.parties = $0.searchText.isEmpty ? repository.getParties() : repository.getParties(by: $0.searchText)
            }
        case .viewDidAppear:
            stateSubject.value.update {
                $0.parties = $0.searchText.isEmpty ? repository.getParties() : repository.getParties(by: $0.searchText)
            }
        case let .searchTextChanged(searchString):
            stateSubject.value.update {
                $0.searchText = searchString
                $0.parties = searchString.isEmpty ? repository.getParties() : repository.getParties(by: searchString)
            }
        case .partyItemTapped(let _):
            break
        }
    }
}

typealias PartyListViewModelProtocol = ViewModel<PartyList.State, PartyList.Action>

enum PartyList {

    struct State: StateProtocol {
        var parties: [Party] = []
        var searchText: String = ""
    }

    enum Action {
        case plusButtonTapped
        case viewDidAppear
        case searchTextChanged(_ searchString: String)
        case partyItemTapped(_ party: Party)
    }
}
