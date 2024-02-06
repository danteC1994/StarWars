//
//  AvatarView.swift
//  StarWars
//
//  Created by dante canizo on 06/02/2024.
//

import SwiftUI

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

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(avatarModel: .init(imageName: "starWars", title: "Luke Skywalker"), contentView: contentForPreview())
    }

    static private func contentForPreview() -> some View {
        Text("Some content here")
    }
}


