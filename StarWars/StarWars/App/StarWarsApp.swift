//
//  StarWarsApp.swift
//  StarWars
//
//  Created by dante canizo on 02/02/2024.
//

import SwiftUI

@main
struct StarWarsApp: App {
    var body: some Scene {
        WindowGroup {
            PeopleFactory.createPeopleList()
        }
    }
}
