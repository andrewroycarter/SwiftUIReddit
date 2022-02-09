//
//  PostCellViewModel.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import Foundation

struct PostCellViewModel: Identifiable {
    let id: String
    let title: String
    let shouldShowSubredditIcon: Bool
    let subredditIconURL: URL?
    let subredditName: String
    let capitalizedAuthor: String
    let shouldShowArticleThumbnail: Bool
    let articleThumbnailURL: URL?
    let articleThumbnailHost: String?
    let score: String
    let comments: String
    
    init(post: Post) {
        id = post.id
        title = post.title
        shouldShowSubredditIcon = post.srDetail?.cleanedCommunityIconURL != nil
        subredditIconURL = post.srDetail?.cleanedCommunityIconURL
        subredditName = post.subreddit
        capitalizedAuthor = post.author.capitalized
        shouldShowArticleThumbnail = post.postHint == .link && post.thumbnailURL != nil
        articleThumbnailHost = post.hostOfUrlOverriddenByDest
        articleThumbnailURL = post.thumbnailURL
        score = String(post.score)
        comments = String(post.numComments)
    }
}
