//
//  GenericErrorView.swift
//  StarWars
//
//  Created by dante canizo on 06/02/2024.
//

import SwiftUI

struct GenericErrorView: View {
    let errorDescription: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.orange)
                .cornerRadius(60)
            VStack(spacing: 24) {
                Spacer()
                HStack {
                    Spacer()
                    Image("starWarsError")
                        .clipShape(Circle())
                        .padding(.top)
                    Spacer()
                }
                Text(errorDescription)
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
    }
}

struct GenericErrorView_Previews: PreviewProvider {
    static var previews: some View {
        GenericErrorView(errorDescription: "Sorry, we are having some technical problems")
    }
}
