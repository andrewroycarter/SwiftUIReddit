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
                .padding(.init(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0))
            Spacer()
            switch viewModel.body {
            case .article(let thumbnail, let host):
                PostCellLinkBody(title: viewModel.title,
                                 articleThumbnailURL: thumbnail,
                                 articleThumbnailHost: host)
                    .padding(.init(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0))
            case .image(let url):
                PostCellImageBody(title: viewModel.title,
                                  url: url)
                    .padding(.zero)
            case .plain:
                PostCellPlainBody(title: viewModel.title)
                    .padding(.init(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0))
            }
            Spacer()
            PostCellActionsView(score: viewModel.score,
                                comments: viewModel.comments)
                .padding(.init(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0))
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(viewModel: PostCellViewModel(post: Post.testPlainPost))
            .previewLayout(.sizeThatFits)
        PostCell(viewModel: PostCellViewModel(post: Post.testLinkPost))
            .previewLayout(.sizeThatFits)
        PostCell(viewModel: PostCellViewModel(post: Post.testImagePost))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
