//
//  SideMenuFooterView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/11/22.
//

import SwiftUI

struct SideMenuFooterView: View {
    var body: some View {
        HStack {
            Image(systemName: "gearshape")
            Text("Settings")
            Spacer()
            Image(systemName: "moon")
        }
    }
}

struct SideMenuFooterView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuFooterView()
            .previewLayout(.sizeThatFits)
    }
}
