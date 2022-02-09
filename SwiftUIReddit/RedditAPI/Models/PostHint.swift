//
//  PostHint.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import Foundation

enum PostHint: String, Codable {
    case link
    case image
    case `self`
    case hostedVideo = "hosted:video"
    case richVideo = "rich:video"
}
