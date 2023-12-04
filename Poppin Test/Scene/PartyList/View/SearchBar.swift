//
//  SearchBar.swift
//  Poppin Test
//
//  Created by Sajjad on 12/3/23.
//

import SwiftUI

struct SearchBar: View {

    private enum Constants {
        static let height = 40.0
        static let cornerWidth = 2.0
        static let maxSearchChars = 20
    }

    @Binding var searchText: String
    var onTextChange: (String) -> Void

    var body: some View {
        ZStack {
            TextField("Search", text: $searchText)
                .multilineTextAlignment(.center)
                .frame(height: Constants.height)
                .background(
                    RoundedRectangle(cornerRadius: Constants.height / 2)
                        .fill(.colorBackground)
                        .stroke(Color.colorCtaBorder, lineWidth: Constants.cornerWidth)
                        .frame(height: Constants.height)
                )
                .foregroundStyle(.colorBackgroundText)
                .padding(.horizontal)
                .tint(.colorCtaBorder)
                .onChange(of: searchText) { _, newValue in
                    guard newValue.count <= Constants.maxSearchChars else {
                        return
                    }

                    onTextChange(newValue)
                }
            HStack {
                Spacer()
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.colorBackgroundText)
                    }
                    .frame(width: Constants.height / 2, height: Constants.height / 2)
                    .padding(.trailing)
                    .padding(.trailing, Constants.height / 4)
                    .background(.clear)
                }
            }
        }
    }
}
