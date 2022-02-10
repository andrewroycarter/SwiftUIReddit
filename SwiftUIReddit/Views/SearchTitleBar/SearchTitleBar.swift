//
//  SearchTitleBar.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/10/22.
//

import SwiftUI

struct SearchTitleBar: View {
    
    @State var searchFieldText = ""
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "person.crop.rectangle.fill")
                .foregroundColor(.redditLightBackground)
            Spacer()
            TextField("Search", text: $searchFieldText)
                .textFieldStyle(.roundedBorder)
            Spacer()
            Image(systemName: "play.tv")
                .foregroundColor(.red)
            Spacer()
            Image(systemName: "bitcoinsign.circle")
                .foregroundColor(.yellow)
            Spacer()
        }
        .frame(minHeight: 60.0)
    }
}

struct SearchTitleBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchTitleBar()
            .previewLayout(.sizeThatFits)
    }
}
