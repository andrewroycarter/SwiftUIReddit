//
//  PostCellViewModel.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import Foundation

struct PostCellViewModel: Identifiable {
    
    enum Body {
        case image(URL?)
        case article(thumbnail: URL?, host: String?)
        case plain
    }
    
    let id: String
    let title: String
    let shouldShowSubredditIcon: Bool
    let subredditIconURL: URL?
    let subredditName: String
    let capitalizedAuthor: String
    let score: String
    let comments: String
    let shouldShowContentImage: Bool
    let body: Body
    
    init(post: Post) {
        id = post.id
        title = post.title
        shouldShowSubredditIcon = post.srDetail?.cleanedCommunityIconURL != nil
        subredditIconURL = post.srDetail?.cleanedCommunityIconURL
        subredditName = post.subreddit
        capitalizedAuthor = post.author.capitalized
        score = String(post.score)
        comments = String(post.numComments)
        shouldShowContentImage = post.postHint == .image
        
        let idealSize = 320
        let idealImageURL = post
            .preview?
            .images
            .first?
            .resolutions
            .compactMap { image -> (URL, Int)? in
                guard let url = image.cleanURL else {
                    return nil
                }
                return (url, abs(idealSize - image.width))
            }
            .sorted(by: { $0.1 < $1.1 })
            .first?
            .0
        
        switch post.postHint {
        case .link:
            body = .article(thumbnail: post.thumbnailURL, host: post.hostOfUrlOverriddenByDest)
            
        case .image:
            body = .image(idealImageURL)
            
        default:
            body = .plain
        }
    }
}
