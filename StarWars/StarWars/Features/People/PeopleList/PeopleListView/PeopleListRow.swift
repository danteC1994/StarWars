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
        .contentShape(Rectangle())
        .frame(maxWidth: .infinity)
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
                        people: PeopleModelMocks.getPeople()
                    )
                }
            }
        }
    }
}
