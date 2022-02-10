//
//  SubredditStore.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import Foundation

@MainActor
class SubredditStore: ObservableObject {
    
    @Published private (set) var postCellViewModels: [PostCellViewModel] = []
    @Published private (set) var isLoadingFirstPage = false
    @Published private (set) var errorText: String?
    @Published var subredditSortBy: Subreddit.Sort {
        didSet {
            Task {
                await refreshPosts()
            }
        }
    }
    
    let subredditPath: Subreddit.Path
    let subredditService: Subreddit.Service
    
    init(subredditPath: Subreddit.Path,
         subredditSortBy: Subreddit.Sort,
         subredditService: @escaping Subreddit.Service = RedditAPI.shared.request ) {
        self.subredditPath = subredditPath
        self.subredditSortBy = subredditSortBy
        self.subredditService = subredditService
    }
    
    func refreshPosts() async {
        errorText = nil
        postCellViewModels = []
        isLoadingFirstPage = true
        let endpoint = Subreddit(subredditPath: subredditPath, sortBy: subredditSortBy)
        do {
            let listing = try await subredditService(endpoint)
            postCellViewModels = listing.data.children.map { PostCellViewModel(post: $0.data) }
        } catch {
            self.errorText = error.localizedDescription
        }
        
        isLoadingFirstPage = false
    }
}
