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
        testLinkPost,
        testPlainPost,
        testImagePost
    ]
    
    static let testLinkPost =  Post(id: UUID().uuidString,
                                    title: "This post is a link post and so it should render as a link post.",
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
    
    static let testImagePost =  Post(id: UUID().uuidString,
                                     title: "This post is an image post and so it should render as a link post.",
                                     author: "Andrew",
                                     score: 10,
                                     numComments: 20,
                                     subreddit: "Cats",
                                     subredditNamePrefixed: "r/Cats",
                                     urlOverriddenByDest: "http://www.test.com",
                                     postHint: .image,
                                     thumbnail: "https://b.thumbs.redditmedia.com/zgQOWbv7dgUS8SmGUjozhWr_ZJXbeycX1EjspB_x1GE.jpg",
                                     preview: .init(images: [
                                        .init(source: .init(url: "https://preview.redd.it/kl8pub63z6h81.gif?width=320&;amp;amp;crop=smart&amp;amp;format=png8&amp;amp;s=8c3a3b360f83c428f5eda8dbb7c9729f77adf07b",
                                                            width: 320,
                                                            height: 262),
                                              resolutions: [
                                                .init(url: "https://preview.redd.it/kl8pub63z6h81.gif?width=320&;amp;amp;crop=smart&amp;amp;format=png8&amp;amp;s=8c3a3b360f83c428f5eda8dbb7c9729f77adf07b",
                                                      width: 320,
                                                      height: 262)
                                              ])
                                     ]),
                                     srDetail: SubredditDetail.testSubredditDetail)
    
    static let testPlainPost =  Post(id: UUID().uuidString,
                                     title: "This post is a plain post and so it should render as a link post.",
                                     author: "Andrew",
                                     score: 10,
                                     numComments: 20,
                                     subreddit: "Cats",
                                     subredditNamePrefixed: "r/Cats",
                                     urlOverriddenByDest: "http://www.test.com",
                                     postHint: .none,
                                     thumbnail: "https://b.thumbs.redditmedia.com/zgQOWbv7dgUS8SmGUjozhWr_ZJXbeycX1EjspB_x1GE.jpg",
                                     preview: nil,
                                     srDetail: SubredditDetail.testSubredditDetail)
}
