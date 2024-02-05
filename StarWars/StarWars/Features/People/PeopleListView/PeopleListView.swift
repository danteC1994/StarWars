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
        NavigationView {
            if viewModel.isPeopleLoading {
                ProgressView()
            } else {
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                    List {
                        ForEach(viewModel.peopleList.results) { people in
                            PeopleListRow(people: people)
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.getPeople()
            }
        }
    }
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListFactory.createPeopleList()
    }
}
