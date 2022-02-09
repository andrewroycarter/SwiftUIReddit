//
//  SubredditStore.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import Foundation

protocol SubredditStoreType: ObservableObject {
    
    var subreddit: String? { get }
    var postCellViewModels: [PostCellViewModel] { get }
    var isLoadingFirstPage: Bool { get }
    var errorText: String? { get }
    
    @MainActor
    func refreshPosts() async
    
}

class SubredditStore: SubredditStoreType {
    
    @Published private (set) var postCellViewModels: [PostCellViewModel] = []
    @Published private (set) var isLoadingFirstPage = false
    @Published private (set) var errorText: String?
    
    let subreddit: String?
    let api = RedditAPI()
    
    init(subreddit: String?) {
        self.subreddit = subreddit
    }
    
    @MainActor
    func refreshPosts() async {
        errorText = nil
        postCellViewModels = []
        isLoadingFirstPage = true
        let endpoint = Subreddit(path: "/.json")
        do {
            let listing = try await api.request(endpoint)
            postCellViewModels = listing.data.children.map { PostCellViewModel(post: $0.data) }
        } catch {
            self.errorText = error.localizedDescription
        }
        
        isLoadingFirstPage = false
    }
}

class PreviewSubredditStore: SubredditStoreType {
    
    @Published private (set) var postCellViewModels: [PostCellViewModel] = []
    @Published private (set) var isLoadingFirstPage = false
    @Published private (set) var errorText: String?

    let subreddit: String?
    let shouldLoadForever: Bool

    init(subreddit: String?, shouldLoadForever: Bool) {
        self.subreddit = subreddit
        self.shouldLoadForever = shouldLoadForever
    }
    
    @MainActor
    func refreshPosts() async {
        errorText = nil
        postCellViewModels = []
        isLoadingFirstPage = true
        guard !shouldLoadForever else {
            return
        }
        postCellViewModels = Post.testPosts.map(PostCellViewModel.init(post:))
        isLoadingFirstPage = false
    }
}


