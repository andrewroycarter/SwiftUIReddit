//
//  SwiftUIRedditApp.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import SwiftUI

@main
struct SwiftUIRedditApp: App {
    var body: some Scene {
        WindowGroup {
            PostListView(subredditStore: SubredditStore(subreddit: nil))
        }
    }
}
