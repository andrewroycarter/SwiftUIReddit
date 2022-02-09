//
//  PostListView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import SwiftUI

struct PostListView<T: SubredditStoreType>: View {
    
    @StateObject var subredditStore: T
    
    var body: some View {
        Group {
            if subredditStore.isLoadingFirstPage {
                ProgressView()
            } else {
                List {
                    HStack {
                        Image(systemName: "airplane.departure")
                        Text("Best Posts")
                        Image(systemName: "chevron.down")
                        Spacer()
                        Image(systemName: "list.bullet.below.rectangle")
                    }
                    .listRowBackground(Color.secondary)
                    
                    ForEach(subredditStore.postCellViewModels, content: PostCell.init(viewModel:))
                }
                .listStyle(.plain)
            }
        }
        .task {
            await subredditStore.loadPosts()
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(subredditStore: PreviewSubredditStore(subreddit: nil, shouldLoadForever: false))
        PostListView(subredditStore: PreviewSubredditStore(subreddit: nil, shouldLoadForever: true))
    }
}
