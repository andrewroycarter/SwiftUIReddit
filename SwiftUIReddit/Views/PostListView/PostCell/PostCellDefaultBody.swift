//
//  PostCellDefaultBody.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import SwiftUI

struct PostCellDefaultBody: View {
    
    let title: String
    let articleThumbnailURL: URL?
    let shouldShowArticleThumbnail: Bool
    let articleThumbnailHost: String?
    
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .font(.body)
                .lineLimit(5)
                .multilineTextAlignment(.leading)
            Spacer(minLength: 0.0)
            
            if shouldShowArticleThumbnail {
                Spacer(minLength: 8.0)
                ZStack(alignment: .bottom) {
                    AsyncImage(url: articleThumbnailURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                    }
                    .frame(maxWidth: 120, maxHeight: 90.0)
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

struct PostCellDefaultBody_Previews: PreviewProvider {
    static var previews: some View {
        PostCellDefaultBody(title: Post.testPost.title,
                            articleThumbnailURL: Post.testPost.thumbnailURL,
                            shouldShowArticleThumbnail: true,
                            articleThumbnailHost: Post.testPost.hostOfUrlOverriddenByDest)
            .previewLayout(.sizeThatFits)
    }
}
