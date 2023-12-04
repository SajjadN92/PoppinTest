//
//  PlusNavigationButton.swift
//  Poppin Test
//
//  Created by Sajjad on 12/3/23.
//

import SwiftUI

struct PlusNavigationButton: View {

    private enum Constants {
        static let size = 40.0
        static let borderWidth = 2.0
    }

    private var action: () -> Void

    public init(action: @escaping () -> Void) {
        self.action = action
    }

    var body: some View {
        Menu {
            Button(action: {
                action()
            }) {
                Text("Add Random Party")
            }
        } label: {
            Label("", systemImage: "plus")
                .frame(width: Constants.size, height: Constants.size)
                .tint(.colorOnCta)
                .background(
                    Circle()
                        .fill(Color.colorCtaBackground)
                        .stroke(Color.colorCtaBorder, lineWidth: Constants.borderWidth)
                        .frame(width: Constants.size, height: Constants.size)
                )
        }
    }
}
