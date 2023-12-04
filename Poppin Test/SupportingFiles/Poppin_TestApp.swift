//
//  Poppin_TestApp.swift
//  Poppin Test
//
//  Created by Sajjad on 12/2/23.
//

import SwiftUI

@main
struct Poppin_TestApp: App {

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.colorBackgroundText
        ]
        appearance.backgroundColor = UIColor.colorBackground
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some Scene {
        WindowGroup {
            PartyListView(
                viewModel: PartyListViewModel(
                    stateSubject: .init(.init()),
                    repository: PartyRepository(localStore: PartyLocalStore())
                )
            )
        }
    }
}
