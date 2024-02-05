//
//  PeopleListView.swift
//  StarWars
//
//  Created by dante canizo on 04/02/2024.
//

import SwiftUI

struct PeopleListView: View {
    @ObservedObject var viewModel: PeopleListViewModel

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .task {
                await viewModel.getPeople()
            }
//            .onAppear{ viewModel.getPeople() }
    }
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListFactory.createPeopleList()
    }
}
