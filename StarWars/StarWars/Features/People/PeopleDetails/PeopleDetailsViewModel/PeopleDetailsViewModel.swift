//
//  PeopleDetailsViewModel.swift
//  StarWars
//
//  Created by dante canizo on 06/02/2024.
//

import Foundation

class PeopleDetailsViewModel: ObservableObject {
    @Published var people: People

    init(people: People) {
        self.people = people
    }
}
