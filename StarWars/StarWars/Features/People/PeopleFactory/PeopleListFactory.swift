//
//  PeopleListFactory.swift
//  StarWars
//
//  Created by dante canizo on 04/02/2024.
//

import Foundation

struct PeopleListFactory {
    static func createPeopleList() -> PeopleListView {
        let viewModel = PeopleListViewModel()
        return PeopleListView(viewModel: viewModel)
    }
}
