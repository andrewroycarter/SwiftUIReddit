//
//  Listing.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import Foundation

struct Listing: Codable {
    let after: String?
    let children: [Kind<Post>]
}
