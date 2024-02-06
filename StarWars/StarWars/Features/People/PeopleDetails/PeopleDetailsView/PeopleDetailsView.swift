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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PeopleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleFactory.createPeopleDetails()
    }
}
