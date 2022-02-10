//
//  PostListView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import SwiftUI

struct PostListView: View {
    
    @StateObject var subredditStore: SubredditStore
    @EnvironmentObject var bottomSheetStore: BottomSheetStore

    var body: some View {
        Group {
            List {
                if let errorText = subredditStore.errorText {
                    HStack {
                        Spacer()
                        Text(errorText)
                        Spacer()
                    }
                } else {
                    HStack {
                        Image(systemName: "airplane.departure")
                        Button {
                            withAnimation {
                                bottomSheetStore.present {
                                    SortPostsSheet()
                                }
                            }
                        } label: {
                            Text("Hot Posts")
                        }
                        Image(systemName: "chevron.down")
                        Spacer()
                        Image(systemName: "list.bullet.below.rectangle")
                    }
                    .listRowBackground(Color.redditLightGray)
                    
                    if subredditStore.isLoadingFirstPage {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    } else {
                        ForEach(subredditStore.postCellViewModels, content: PostCell.init(viewModel:))
                    }
                }
            }
            .listStyle(.plain)
        }
        .task {
            await subredditStore.refreshPosts()
        }
        .refreshable {
            await subredditStore.refreshPosts()
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(subredditStore: SubredditStore(subredditPath: .hot,
                                                    subredditService: Subreddit.makeMockService(returning: Post.testPosts)))
 
    }
}
