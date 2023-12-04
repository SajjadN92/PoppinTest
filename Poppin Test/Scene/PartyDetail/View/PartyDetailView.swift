//
//  PartyDetailView.swift
//  Poppin Test
//
//  Created by Sajjad on 12/3/23.
//

import SwiftUI

struct PartyDetailView: View {

    private enum Constants {
        static let buttonSize = CGSize(width: 250, height: 60)
        static let cornerRadius = 20.0
    }

    @Environment(\.presentationMode) var presentationMode
    @State private var state: PartyDetail.State = .init()
    private let viewModel: any PartyDetailViewModelProtocol

    init(viewModel: any PartyDetailViewModelProtocol) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            if let cardViewModel = state.party {
                ScrollView {
                    VStack {
                        AsyncImage(url: cardViewModel.imageURL) { phase in
                            switch phase {
                            case let .success(image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            default:
                                EmptyView()
                            }
                        }

                        HStack {
                            Text(cardViewModel.name)
                                .font(.title)
                                .foregroundStyle(.colorOnCta)
                            Spacer()
                        }
                        .padding(.horizontal)

                        HStack {
                            Image(systemName: "calendar")
                                .foregroundStyle(.colorOnCta)
                            Text(cardViewModel.dateString)
                                .font(.headline)
                                .foregroundStyle(.colorOnCta)
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top)

                        HStack {
                            Image(systemName: "dollarsign.square.fill")
                                .foregroundStyle(.colorOnCta)
                            Text(cardViewModel.priceString)
                                .font(.headline)
                                .foregroundStyle(.colorOnCta)
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "figure.run.square.stack.fill")
                                .foregroundStyle(.colorOnCta)
                            Text(cardViewModel.amountGoingString)
                                .font(.headline)
                                .foregroundStyle(.colorOnCta)
                            Spacer()
                        }
                        .padding(.horizontal)

                        Spacer(minLength: 100)

                        Button(action: {
                            
                        }, label: {
                            Text("Attend The Party")
                                .background(.colorCtaBackground)
                                .foregroundStyle(.colorOnCta)
                                .font(.headline)
                        })
                        .frame(width: Constants.buttonSize.width, height: Constants.buttonSize.height)
                        .background(.colorCtaBackground)
                        .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
                        
                    }
                }
                .background(.colorBackground)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {
            presentationMode.wrappedValue.dismiss()
        }), trailing: Button(action: {
            
        }, label: {
            Image(systemName: "square.and.arrow.up")
                .foregroundStyle(.colorCtaBackground)
        }))
        .onAppear(perform: {
            viewModel.handle(action: .viewDidAppear)
        }).onReceive(viewModel.statePublisher, perform: {
            state = $0
        })
    }
}
