//
//  PeopleListFactory.swift
//  StarWars
//
//  Created by dante canizo on 04/02/2024.
//

import Foundation

struct PeopleListFactory {
    static func createPeopleList() -> PeopleListView {
        let peopleService = PeopleService()
        let peopleRepository = PeopleRepository(peopleService: peopleService)
        let viewModel = PeopleListViewModel(peopleRepository: peopleRepository)
        return PeopleListView(viewModel: viewModel)
    }
}
