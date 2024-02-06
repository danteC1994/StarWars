//
//  PeopleDetailsView.swift
//  StarWars
//
//  Created by dante canizo on 06/02/2024.
//

import SwiftUI

struct PeopleDetailsView: View {
    @ObservedObject var viewModel: PeopleDetailsViewModel

    var body: some View {
        ScrollView {
            VStack {
                AvatarView(avatarModel: .init(imageName: "starWars", title: viewModel.people.name), contentView: avatarDescription(people: viewModel.people))
                    .padding()
                if viewModel.isStarshipLoading {
                    ProgressView()
                } else {
                    Text("\(viewModel.people.name) Starships:")
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(alignment: .leading)
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 24) {
                            ForEach(viewModel.starships) { starShip in
                                AvatarView(
                                    avatarModel: .init(
                                        imageName: "starWarsSpaceShip",
                                        title: starShip.name ?? ""
                                    ),
                                    contentView: avatarStarshipDescription(starship: starShip)
                                )
                                .frame(width: 300)
                                .onAppear{
                                    if starShip == viewModel.starships.last, !viewModel.isStarshipLoading {
                                        Task {
                                            await viewModel.getStarship()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .scrollIndicators(.hidden)
    }

    private func avatarDescription(people: People) -> some View {
        VStack(spacing: 16) {
            HorizontalRow(
                title: "Mass: ",
                description: people.mass,
                font: .title
            )
            HorizontalRow(
                title: "Gender: ",
                description: people.gender,
                font: .title
            )
            HorizontalRow(
                title: "Height: ",
                description: people.height,
                font: .title
            )
            HorizontalRow(
                title: "Starships: ",
                description: "\(people.starships.count)",
                font: .title
            )
            HorizontalRow(
                title: "Vehicles: ",
                description: "\(people.vehicles.count)",
                font: .title
            )
        }
    }

    private func avatarStarshipDescription(starship: Starship) -> some View {
        VStack(spacing: 8) {
            if let model = starship.model {
                HorizontalRow(
                    title: "Model: ",
                    description: model,
                    font: .body
                )
            }
            HorizontalRow(
                title: "Passengers: ",
                description: starship.passengers,
                font: .body
            )
            if let length = starship.length {
                HorizontalRow(
                    title: "Length: ",
                    description: length,
                    font: .body
                )
            }
            if let manufacturer = starship.manufacturer {
                HorizontalRow(
                    title: "Manufacturer: ",
                    description: manufacturer,
                    font: .body
                )
            }
            if let crew = starship.crew {
                HorizontalRow(
                    title: "Crew: ",
                    description: crew,
                    font: .body
                )
            }
        }
    }
}

struct PeopleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleFactory.createPeopleDetails(people: PeopleModelMocks.getPeople())
    }
}
