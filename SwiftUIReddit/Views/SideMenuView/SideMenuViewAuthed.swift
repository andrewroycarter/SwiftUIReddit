//
//  SideMenuViewAuthed.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/14/22.
//

import SwiftUI

struct SideMenuViewAuthed: View {

    @Binding var user: User?
    
    var body: some View {
        if let user = user {
            Text(user.name)
        } else {
            ProgressView()
        }
    }
}

struct SideMenuViewAuthed_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuViewAuthed(user: .constant(User.testUser))
    }
}
