//
//  Subreddit.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import Foundation
import SwiftUI

struct Subreddit: Endpoint {
    
    typealias Service = (Subreddit) async throws -> Subreddit.DecodeType
    
    enum Sort: String, CaseIterable, Identifiable {
        case hot
        case new
        case rising
        case controversial
        case top
        
        var id: String {
            return rawValue
        }
        
        var icon: Image {
            switch self {
            case .hot:
                return Image(systemName: "flame")
                
            case .new:
                return Image(systemName: "sun.min")

            case .rising:
                return Image(systemName: "chart.line.uptrend.xyaxis")

            case .controversial:
                return Image(systemName: "waveform.badge.exclamationmark")

            case .top:
                return Image(systemName: "chart.bar.xaxis")
            }
        }
    }
    
    enum Path {
        case home
        case subreddit(String)
    }
    
    typealias DecodeType = Kind<Listing>
    
    var path: String {
        let path: String
        
        switch subredditPath {
        case .home:
            path = ""
            
        case .subreddit(let name):
            path = "/r/\(name)"
        }
        
        let sortedPath = path + "/" + sortBy.rawValue
        let jsonPath = sortedPath + "/.json"
        return jsonPath
    }
    
    let subredditPath: Path
    let sortBy: Sort
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
