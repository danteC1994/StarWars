//
//  PeopleListViewModel.swift
//  StarWars
//
//  Created by dante canizo on 04/02/2024.
//

import Combine

class PeopleListViewModel: ObservableObject {
    @Published var people = [People]()
    @Published var isPeopleLoading = false
    let peopleRepository: PeopleRepository

    init(peopleRepository: PeopleRepository) {
        self.peopleRepository = peopleRepository
    }

    @MainActor
    func getPeople() async {
        isPeopleLoading = true
        defer { isPeopleLoading = false }
        let result = people.count == 0 ? await peopleRepository.requestPeople() : await peopleRepository.requestPeopleNextPage()
        switch result {
        case let .success(peopleList):
            people += peopleList.results
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
