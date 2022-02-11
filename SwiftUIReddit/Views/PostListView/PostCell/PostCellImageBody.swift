//
//  PostCellImageBody.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/11/22.
//

import SwiftUI

struct PostCellImageBody: View {
    
    let title: String
    let url: URL?
    
    var body: some View {
        VStack() {
            HStack {
            Text(title)
                .font(.body)
                .lineLimit(5)
                .multilineTextAlignment(.leading)
                Spacer(minLength: 0.0)
            }
            Spacer()
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
            }
        }
    }
}

struct PostCellImageBody_Previews: PreviewProvider {
    static var previews: some View {
        PostCellImageBody(title: "Title", url: nil)
    }
}
