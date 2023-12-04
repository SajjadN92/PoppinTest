//
//  PartyDetailViewModel.swift
//  Poppin Test
//
//  Created by Sajjad on 12/4/23.
//

import Combine

final class PartyDetailViewModel: ViewModel {

    private let stateSubject: CurrentValueSubject<PartyDetail.State, Never>
    private let party: Party
    var state: PartyDetail.State {
        stateSubject.value
    }
    var statePublisher: AnyPublisher<PartyDetail.State, Never> {
        stateSubject.eraseToAnyPublisher()
    }

    init(
        stateSubject: CurrentValueSubject<PartyDetail.State, Never>,
        party: Party
    ) {
        self.stateSubject = stateSubject
        self.party = party
    }

    func handle(action: PartyDetail.Action) {
        switch action {
        case .viewDidAppear:
            stateSubject.value.update {
                $0.party = PartyCardViewModel(party: party)
            }
        }
    }
}

typealias PartyDetailViewModelProtocol = ViewModel<PartyDetail.State, PartyDetail.Action>

enum PartyDetail {
    struct State: StateProtocol {
        var party: PartyCardViewModel?
    }

    enum Action { 
        case viewDidAppear
    }
}
