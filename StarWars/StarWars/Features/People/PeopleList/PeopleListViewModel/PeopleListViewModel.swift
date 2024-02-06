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
    @Published var showeErrorState = false
    let peopleRepository: PeopleDataManager
    var errorDescription: String = ""

    init(peopleRepository: PeopleDataManager) {
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
            defer { showeErrorState = true }
            switch error {
            case let .url(urlError):
                errorDescription = urlError
            case let .network(networkError):
                errorDescription = networkError
            case let .decoding(decodingError):
                errorDescription = decodingError
            }
        }
    }

    @MainActor
    func refresh() async {
        showeErrorState = false
        await getPeople()
    }
}
