//
//  ViewModel.swift
//  Poppin Test
//
//  Created by Sajjad on 12/3/23.
//

import Combine

protocol ViewModel<State, Action>: AnyObject {
    associatedtype State: StateProtocol
    associatedtype Action

    var state: State { get }
    var statePublisher: AnyPublisher<State, Never> { get }

    func handle(action: Action)
}
