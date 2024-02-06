//
//  HorizontalRow.swift
//  StarWars
//
//  Created by dante canizo on 06/02/2024.
//

import SwiftUI

struct HorizontalRow: View {
    let title: String
    let description: String
    let font: Font

    var body: some View {
        HStack {
            Text("\(title): ")
                .foregroundColor(.black)
                .font(font)
                .fontWeight(.bold)
                .frame(alignment: .leading)
            Text(description)
                .foregroundColor(.black)
                .font(font)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct HorizontalRow_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalRow(title: "Title", description: "Any description", font: .title)
    }
}
