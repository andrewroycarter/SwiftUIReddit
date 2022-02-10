//
//  HomeTabsView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/10/22.
//

import SwiftUI

struct HomeTabsView: View {
    
    let tabs: [HomeTabView.Tab]
    @Binding var selectedTab: HomeTabView.Tab
    
    var body: some View {
        HStack {
            ForEach(tabs) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    VStack {
                        Text(tab.title)
                            .foregroundColor(.primary)
                        Rectangle()
                            .frame(maxWidth: .infinity, minHeight: 2.0, maxHeight: 2.0)
                            .foregroundColor(tab == selectedTab ? Color.redditDarkAccent : .white)
                        
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

struct HomeTabsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabsView(tabs: HomeTabView.Tab.allCases, selectedTab: .constant(.popular))
            .previewLayout(.sizeThatFits)
    }
}
