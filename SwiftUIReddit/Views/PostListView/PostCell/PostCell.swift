//
//  PostCell.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import SwiftUI

struct PostCell: View {
    
    let viewModel: PostCellViewModel
    
    var body: some View {
        VStack {
            PostCellSubredditAuthorView(author: viewModel.capitalizedAuthor,
                                        subreddit: viewModel.subredditName,
                                        iconURL: viewModel.subredditIconURL,
                                        shouldShowIcon: viewModel.shouldShowSubredditIcon)
            Spacer()
            PostCellDefaultBody(title: viewModel.title,
                                articleThumbnailURL: viewModel.articleThumbnailURL,
                                shouldShowArticleThumbnail: viewModel.shouldShowArticleThumbnail,
                                articleThumbnailHost: viewModel.articleThumbnailHost)
            Spacer()
            PostCellActionsView(score: viewModel.score,
                                comments: viewModel.comments)
        }
        .padding(.horizontal)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(viewModel: PostCellViewModel(post: Post.testPost))
            .previewLayout(.sizeThatFits)
        PostCell(viewModel: PostCellViewModel(post: Post.testPost))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
