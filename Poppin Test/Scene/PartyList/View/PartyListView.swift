//
//  PartyListView.swift
//  Poppin Test
//
//  Created by Sajjad on 12/3/23.
//

import SwiftUI

struct PartyListView: View {

    @State private var state: PartyList.State = .init()
    private let viewModel: any PartyListViewModelProtocol

    init(viewModel: any PartyListViewModelProtocol) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $state.searchText, onTextChange: {
                    viewModel.handle(action: .searchTextChanged($0))
                })
                .padding(.vertical)

                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 1), content: {
                        ForEach(state.parties) { party in
                            NavigationLink(destination: PartyDetailView(
                                viewModel: PartyDetailViewModel(
                                    stateSubject: .init(.init()),
                                    party: party
                                )
                            )) {
                                PartyCardView(viewModel: PartyCardViewModel(party: party))
                                    .padding(.bottom)
                                    .padding(.horizontal)
                            }

                        }
                    })
                }
            }
            .background(.colorBackground)
            .navigationTitle("Party Explorer")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: PlusNavigationButton(action: {
                viewModel.handle(action: .plusButtonTapped)
            }))
        }.onAppear(perform: {
            viewModel.handle(action: .viewDidAppear)
        }).onReceive(viewModel.statePublisher, perform: {
            state = $0
        })
    }
}

#Preview {
    PartyListView(
        viewModel: PartyListViewModel(
            stateSubject: .init(.init()),
            repository: PartyRepository(localStore: PartyLocalStore())
        )
    )
}
