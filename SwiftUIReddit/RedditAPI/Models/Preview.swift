//
//  Preview.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/11/22.
//

import Foundation

struct Preview: Codable {
    
    let images: [ImageContainer]
    
    struct ImageContainer: Codable {
        let source: Image
        let resolutions: [Image]
    }

    struct Image: Codable {
        let url: String
        let width: Int
        let height: Int
       
        var cleanURLString: String {
            url.cleaningRedditAPIFormatting()
        }
        
        var cleanURL: URL? {
            return URL(string: cleanURLString)
        }
    }
    
}
