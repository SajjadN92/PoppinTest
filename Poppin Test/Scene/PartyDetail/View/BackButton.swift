//
//  BackButton.swift
//  Poppin Test
//
//  Created by Sajjad on 12/4/23.
//

import SwiftUI

struct BackButton: View {

    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.colorCtaBackground)
        }
    }
}
