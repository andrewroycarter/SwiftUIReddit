//
//  String+RedditAPI.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/11/22.
//

import Foundation

extension String {
    
    func cleaningRedditAPIFormatting() -> String {
        replacingOccurrences(of: ";amp;amp;", with: "").replacingOccurrences(of: "amp;", with: "")
    }
    
}
