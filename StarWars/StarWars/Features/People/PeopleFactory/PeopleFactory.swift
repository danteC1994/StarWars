//
//  PeopleListFactory.swift
//  StarWars
//
//  Created by dante canizo on 04/02/2024.
//

import Foundation

struct PeopleFactory {
    static func createPeopleList() -> PeopleListView {
        let peopleService = PeopleService(session: URLSession.shared, decoder: GenericDecoder())
        let peopleRepository = PeopleRepository(peopleService: peopleService)
        let viewModel = PeopleListViewModel(peopleRepository: peopleRepository)
        return PeopleListView(viewModel: viewModel)
    }

    static func createPeopleDetails() -> PeopleDetailsView {
        let viewModel = PeopleDetailsViewModel()
        return PeopleDetailsView(viewModel: viewModel)
    }
}

extension PeopleFactory {
    static func createPeopleListMock() -> PeopleListView {
        let peopleService = PeopleServiceSuccessMock()
        let peopleRepository = PeopleRepository(peopleService: peopleService)
        let viewModel = PeopleListViewModel(peopleRepository: peopleRepository)
        return PeopleListView(viewModel: viewModel)
    }
}
