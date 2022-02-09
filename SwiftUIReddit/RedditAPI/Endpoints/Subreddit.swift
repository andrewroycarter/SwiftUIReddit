//
//  Subreddit.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import Foundation

struct Subreddit: Endpoint {
    
    typealias DecodeType = Kind<Listing>
    
    let path: String
    let queryItems: [URLQueryItem]? = [URLQueryItem(name: "sr_detail", value: "1")]
    
}
