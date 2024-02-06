//
//  StarshipDetailsViewModel.swift
//  StarWars
//
//  Created by dante canizo on 06/02/2024.
//

import Foundation

class PeopleDetailsViewModel: ObservableObject {
    @Published var people: People
    @Published var isStarshipLoading = false
    @Published var starships = [Starship]()
    let starshipRepository: StarshipDataManager

    init(people: People, starshipRepository: StarshipDataManager) {
        self.people = people
        self.starshipRepository = starshipRepository

        Task {
            await getStarship()
        }
    }

    @MainActor
    func getStarship() async {
        isStarshipLoading = true
        defer { isStarshipLoading = false }
        let result = starships.count == 0 ? await starshipRepository.requestStarship() : await starshipRepository.requestStarshipNextPage()
        switch result {
        case let .success(starshipList):
            starships += starshipList.results
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
