//
//  PeopleListView.swift
//  StarWars
//
//  Created by dante canizo on 04/02/2024.
//

import SwiftUI

struct PeopleListView: View {
    @ObservedObject var viewModel: PeopleListViewModel

    @State var navigate: Bool = false
    @State var selectedPeople: People = .init()

    var body: some View {
        NavigationStack {
                ZStack {
                    Color.secondary
                        .ignoresSafeArea()
                    if viewModel.isPeopleLoading {
                        ProgressView()
                    } else {
                        ScrollView {
                            LazyVStack {
                                ForEach(viewModel.people) { people in
                                    PeopleListRow(people: people)
                                        .onTapGesture {
                                            selectedPeople = people
                                            navigate = true
                                        }
                                        .onAppear {
                                            if people == viewModel.people.last, !viewModel.isPeopleLoading {
                                                Task {
                                                    await viewModel.getPeople()
                                                }
                                            }
                                        }

                                }
                            }
                        }
                    }
            }
                .navigationDestination(
                     isPresented: $navigate
                ) {
                    PeopleFactory.createPeopleDetails(people: selectedPeople)
                }
        }
        .onAppear {
            Task {
                await viewModel.getPeople()
            }
        }
        .refreshable {
            await viewModel.getPeople()
        }
    }
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleFactory.createPeopleListMock()
    }
}
