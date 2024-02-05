//
//  PeopleListRow.swift
//  StarWars
//
//  Created by dante canizo on 04/02/2024.
//

import SwiftUI

struct PeopleListRow: View {
    let people: People
    var body: some View {
        Rectangle()
            .foregroundColor(Color.secondary)
        HStack {
            VStack(spacing: 16) {
                Text(people.name)
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(people.gender)
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(people.height)
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(people.mass)
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.leading)
        }
        .aspectRatio(1.0, contentMode: .fit)
        .cornerRadius(8)
        .listRowInsets(.init(top: 8, leading: 8, bottom: 8, trailing: 8))
    }
}

struct PeopleListRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ScrollView {
                LazyVStack {
                    PeopleListRow(
                        people: .init(
                            birthYear: nil,
                            eyeColor: nil,
                            films: [],
                            gender: "male",
                            hairColor: "blond",
                            height: "188",
                            homeworld: "https://swapi.dev/api/planets/1/",
                            mass: "84",
                            name: "Anakin Skywalker",
                            skinColor: "fair",
                            created: "2014-12-10T16:20:44.310000Z",
                            edited: nil,
                            species: [],
                            starships: [],
                            url: "https://swapi.dev/api/people/11/",
                            vehicles: []
                        )
                    )
                }
            }
        }
    }
}
