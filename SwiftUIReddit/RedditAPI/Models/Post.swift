//
//  Post.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import Foundation

struct Post: Codable {
    
    let id: String
    let title: String
    let author: String
    let score: Int
    let numComments: Int
    let subreddit: String
    let subredditNamePrefixed: String
    let urlOverriddenByDest: String?
    let postHint: PostHint?
    let thumbnail: String?
    let preview: Preview?
    let srDetail: SubredditDetail?
    
    var thumbnailURL: URL? {
        return thumbnail.flatMap(URL.init(string:))
    }
    
    var hostOfUrlOverriddenByDest: String? {
        return urlOverriddenByDest.flatMap(URLComponents.init(string:)).flatMap(\.host)
    }
    
    static let testPosts = [
        Post(id: UUID().uuidString,
             title: "First test post",
             author: "Andrew",
             score: 10,
             numComments: 20,
             subreddit: "Cats",
             subredditNamePrefixed: "r/Cats",
             urlOverriddenByDest: "http://www.test.com",
             postHint: .image,
             thumbnail: "https://b.thumbs.redditmedia.com/zgQOWbv7dgUS8SmGUjozhWr_ZJXbeycX1EjspB_x1GE.jpg",
             preview: nil,
             srDetail: SubredditDetail.testSubredditDetail),
        Post(id: UUID().uuidString,
             title: "Second test post",
             author: "Andrew",
             score: 200,
             numComments: 30,
             subreddit: "Cats",
             subredditNamePrefixed: "r/Cats",
             urlOverriddenByDest: "http://www.test.com",
             postHint: .link,
             thumbnail: "https://b.thumbs.redditmedia.com/zgQOWbv7dgUS8SmGUjozhWr_ZJXbeycX1EjspB_x1GE.jpg",
             preview: nil,
             srDetail: SubredditDetail.testSubredditDetail)
    ]
    
    static let testPost =  Post(id: UUID().uuidString,
                                title: "First test post",
                                author: "Andrew",
                                score: 10,
                                numComments: 20,
                                subreddit: "Cats",
                                subredditNamePrefixed: "r/Cats",
                                urlOverriddenByDest: "http://www.test.com",
                                postHint: .link,
                                thumbnail: "https://b.thumbs.redditmedia.com/zgQOWbv7dgUS8SmGUjozhWr_ZJXbeycX1EjspB_x1GE.jpg",
                                preview: nil,
                                srDetail: SubredditDetail.testSubredditDetail)
}
