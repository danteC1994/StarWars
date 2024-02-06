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
            HStack {
                Text("Mass: ")
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(alignment: .leading)
                Text(people.mass)
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            HStack {
                Text("Gender: ")
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(alignment: .leading)
                Text(people.gender)
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            HStack {
                Text("Height: ")
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(alignment: .leading)
                Text(people.height)
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            HStack {
                Text("Starships: ")
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(alignment: .leading)
                Text("\(people.starships.count)")
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            HStack {
                Text("Vehicles: ")
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(alignment: .leading)
                Text("\(people.vehicles.count)")
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    private func avatarStarshipDescription(starship: Starship) -> some View {
        VStack(spacing: 8) {
            if let model = starship.model {
                HStack {
                    Text("Model: ")
                        .foregroundColor(.black)
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(alignment: .leading)
                    Text(model)
                        .foregroundColor(.black)
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            HStack {
                Text("Passengers: ")
                    .foregroundColor(.black)
                    .font(.body)
                    .fontWeight(.bold)
                    .frame(alignment: .leading)
                Text(starship.passengers)
                    .foregroundColor(.black)
                    .font(.body)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            if let length = starship.length {
                HStack {
                    Text("Length: ")
                        .foregroundColor(.black)
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(alignment: .leading)
                    Text(length)
                        .foregroundColor(.black)
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            if let manufacturer = starship.manufacturer {
                HStack {
                    Text("Manufacturer: ")
                        .foregroundColor(.black)
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(alignment: .leading)
                    Text(manufacturer)
                        .foregroundColor(.black)
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            if let crew = starship.crew {
                HStack {
                    Text("Crew: ")
                        .foregroundColor(.black)
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(alignment: .leading)
                    Text(crew)
                        .foregroundColor(.black)
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

struct PeopleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleFactory.createPeopleDetails(people: PeopleModelMocks.getPeople())
    }
}

struct AvatarView<Description>: View where Description: View {
    let avatarModel: AvatarModel
    let contentView: Description

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.secondary)
                .cornerRadius(60)
            VStack{
                Image(avatarModel.imageName)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipShape(Circle())
                HStack {
                    VStack(spacing: 16) {
                        Text(avatarModel.title)
                            .foregroundColor(.black)
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .center)
                        contentView
                    }
                    .padding(.leading)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
        }
    }
}

struct AvatarModel {
    let imageName: String
    let title: String
}
