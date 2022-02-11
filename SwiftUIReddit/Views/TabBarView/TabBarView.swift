//
//  TabBarView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/9/22.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        TabView {
            HomeTabView()
                .tabItem {
                    Image(systemName: "house")
                }
            Text("Placeholder")
                .tabItem {
                    Image(systemName: "square.grid.3x3.square")
                }
            Text("Placeholder")
                .tabItem {
                    Image(systemName: "plus")
                }
            Text("Placeholder")
                .tabItem {
                    Image(systemName: "text.bubble")
                }
            Text("Placeholder")
                .tabItem {
                    Image(systemName: "bell")
                }
        }.background(Color.red)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
