//
//  PeopleListViewModel.swift
//  StarWars
//
//  Created by dante canizo on 04/02/2024.
//

import Combine

class PeopleListViewModel: ObservableObject {
    @Published var peopleList = PeopleList(count: 0, next: "", previous: "", results: [])
    let peopleRepository: PeopleRepository

    init(peopleRepository: PeopleRepository) {
        self.peopleRepository = peopleRepository
    }

    func getPeople() async {
        let result = await peopleRepository.requestPeople()
        switch result {
        case let .success(people):
            peopleList = people
        case let .failure(error):
            switch error {
            case .url(_):
                break
            case .network(_):
                break
            case .decoding(_):
                break
            }
        }
    }
}
