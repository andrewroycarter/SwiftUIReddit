//
//  HomeTabView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/10/22.
//

import SwiftUI

struct HomeTabView: View {
    
    enum Tab: Identifiable {
        
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
    @State var selectedTab = Tab.home
    
    var body: some View {
        VStack {
            SearchTitleBar()
            Spacer()
            HStack {
                ForEach(tabs) { tab in
                    VStack {
                        Text(tab.title)
                        Rectangle()
                            .frame(maxWidth: .infinity, minHeight: 2.0, maxHeight: 2.0)
                            .foregroundColor(tab == selectedTab ? Color.redditDarkBlue : .white)

                    }
                    .frame(maxWidth: .infinity)
                }
            }
            TabView(selection: $selectedTab) {
                PostListView(subredditStore: SubredditStore(subredditPath: .subreddit("news")))
                    .tag(Tab.news)
                PostListView(subredditStore: SubredditStore(subredditPath: .home))
                    .tag(Tab.home)
                PostListView(subredditStore: SubredditStore(subredditPath: .hot))
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
