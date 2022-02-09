//
//  PostListViewModel.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import Foundation

struct PostListViewModel {
    let postCellViewModels: [PostCellViewModel]
    let isLoadingFirstPage: Bool
    
    init(postCellViewModels: [PostCellViewModel], isLoadingFirstPage: Bool) {
        self.postCellViewModels = postCellViewModels
        self.isLoadingFirstPage = isLoadingFirstPage
    }
    
    init(listing: Kind<Listing>, isLoadingFirstPage: Bool) {
        postCellViewModels = listing.data.children.map { PostCellViewModel(post: $0.data )}
        self.isLoadingFirstPage = isLoadingFirstPage
    }
    
}
