//
//  Subreddit.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import Foundation

struct Subreddit: Endpoint {
    
    typealias Service = (Subreddit) async throws -> Subreddit.DecodeType
    
    enum Path {
        case subreddit(String)
        case hot
        case new
        case top
        case home
    }
    
    typealias DecodeType = Kind<Listing>
    
    var path: String {
        switch subredditPath {
        case .hot:
            return "/hot/.json"
            
        case .new:
            return "/new/.json"
            
        case .top:
            return "/top/.json"
            
        case .home:
            return "/.json"
            
        case .subreddit(let name):
            return "/\(name).json"
        }
    }
    
    let subredditPath: Path
    let queryItems: [URLQueryItem]? = [URLQueryItem(name: "sr_detail", value: "1")]
    
    // MARK: - Static Methods
    
    static func makeMockService(returning result: Kind<Listing>) -> Service {
        return { _ in
            return result
        }
    }
    
    static func makeMockService(returning posts: [Post]) -> Service {
        return { _ in
            let listing = Listing(after: "", children: posts.map { Kind<Post>.init(kind: "", data: $0) })
            return Kind<Listing>(kind: "", data: listing)
        }
    }
    
}
