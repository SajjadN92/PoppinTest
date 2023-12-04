//
//  PartyCardView.swift
//  Poppin Test
//
//  Created by Sajjad on 12/3/23.
//

import SwiftUI

struct PartyCardView: View {

    private enum Constants {
        static let cornerRadius = 10.0
        static let height = 180.0
        static let bottomHeight = 60.0
    }

    let viewModel: PartyCardViewModel

    var body: some View {
        ZStack {
            AsyncImage(url: viewModel.imageURL) { phase in
                switch phase {
                case let .success(image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: Constants.height)
                default:
                    EmptyView()
                }
            }

            VStack {
                HStack {
                    HStack {
                        Image(systemName: "figure.run.square.stack.fill")
                            .foregroundStyle(.colorOnCta)
                        Text("\(viewModel.amountGoing)")
                            .font(.subheadline)
                            .foregroundStyle(.colorOnCta)
                    }
                    .padding(.horizontal, 5)
                    .padding(.vertical, 2)
                    .background(
                        RoundedRectangle(cornerRadius: Constants.cornerRadius)
                        .fill(.colorCtaBackground.opacity(0.9))
                    )

                    Spacer()
                }

                Spacer()
            }

            VStack {
                Spacer()

                ZStack {
                    RoundedRectangle(cornerRadius: Constants.cornerRadius)
                        .fill(.colorCtaBackground.opacity(0.9))

                    HStack {
                        VStack {
                            HStack {
                                Text(viewModel.name)
                                    .font(.subheadline)
                                    .foregroundStyle(.colorOnCta)
                                    .padding(.leading)
                                Spacer()
                                HStack {
                                    Image(systemName: "dollarsign.square.fill")
                                        .foregroundStyle(.colorOnCta)
                                    Text(viewModel.priceString)
                                        .font(.subheadline)
                                        .foregroundStyle(.colorOnCta)
                                }
                                .padding(.trailing)
                            }

                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundStyle(.colorOnCta)
                                    .padding(.leading)

                                Text(viewModel.dateString)
                                    .font(.subheadline)
                                    .foregroundStyle(.colorOnCta)
                                Spacer()
                            }
                        }
                    }
                }
                .frame(height: Constants.bottomHeight)
            }
        }
        .frame(height: Constants.height)
        .background(.colorOnBackground)
        .cornerRadius(Constants.cornerRadius)
    }
}
