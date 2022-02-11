//
//  HomeTabView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/10/22.
//

import SwiftUI

struct HomeTabView: View {
    
    enum Tab: Identifiable, CaseIterable {
        
        case news
        case home
        case popular
        
        var id: String {
            return title
        }
        
        var title: String {
            switch self {
            case .news:
                return "News"
                
            case .home:
                return "Home"
                
            case .popular:
                return "Popular"
            }
        }
    }
    
    let tabs: [Tab] = [.news, .home, .popular]
    @State var selectedTab = Tab.popular
    
    var body: some View {
        VStack {
            SearchTitleBar()
            Spacer()
            HomeTabsView(tabs: tabs, selectedTab: $selectedTab.animation())
            TabView(selection: $selectedTab.animation()) {
                PostListView(subredditStore: SubredditStore(subredditPath: .subreddit("news"), subredditSortBy: .hot))
                    .tag(Tab.news)
                PostListView(subredditStore: SubredditStore(subredditPath: .home, subredditSortBy: .hot))
                    .tag(Tab.home)
                PostListView(subredditStore: SubredditStore(subredditPath: .subreddit("popular"), subredditSortBy: .hot))
                    .tag(Tab.popular)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
