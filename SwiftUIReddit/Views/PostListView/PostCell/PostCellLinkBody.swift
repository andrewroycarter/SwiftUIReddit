//
//  PostCellDefaultBody.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import SwiftUI

struct PostCellLinkBody: View {
    
    let title: String
    let articleThumbnailURL: URL?
    let articleThumbnailHost: String?
    
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .font(.body)
                .lineLimit(5)
                .multilineTextAlignment(.leading)
            Spacer(minLength: 0.0)
            
            if let url = articleThumbnailURL {
                Spacer(minLength: 8.0)
                ZStack(alignment: .bottom) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                    }
                    .frame(width: 120, height: 90.0)
                    if let host = articleThumbnailHost {
                        Text(host)
                            .padding(.horizontal, 3.0)
                            .frame(maxWidth: 120)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .foregroundColor(.white)
                            .background(.black.opacity(0.5))
                            .font(.subheadline)
                    }
                }
                .cornerRadius(8.0)
            }
        }
    }
}

struct PostCellLinkBody_Previews: PreviewProvider {
    static var previews: some View {
        PostCellLinkBody(title: Post.testLinkPost.title,
                            articleThumbnailURL: Post.testLinkPost.thumbnailURL,
                            articleThumbnailHost: Post.testLinkPost.hostOfUrlOverriddenByDest)
            .previewLayout(.sizeThatFits)
    }
}
