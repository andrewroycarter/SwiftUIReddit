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
        VStack(alignment: .center) {
            if let user = user {
                AsyncImage(url: user.snoovatarImgURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100.0, height: 150.0)
                        .foregroundColor(.secondary)
                } placeholder: {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100.0, height: 150.0)
                        .foregroundColor(.secondary)
                }
                Text("u/\(user.name) ").bold() + Text(Image(systemName: "checkerboard.shield")).foregroundColor(.orange) + Text(Image(systemName: "chevron.down"))
                Text("Online Status: Off")
                    .foregroundColor(.secondary)
                    .padding(8.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.secondary, lineWidth: 2.0)
                    )
                HStack {
                    HStack {
                        Image(systemName: "tshirt.fill")
                        Spacer()
                        Text("Style Avatar")
                            .bold()
                        Spacer()
                    }
                    .padding()
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]),
                                   startPoint: .leading,
                                   endPoint: .trailing)
                        .clipShape(Capsule())
                )
                .padding()
                .foregroundColor(.white)
                Spacer()
                HStack {
                    Group {
                        Image(systemName: "snowflake.circle")
                            .foregroundColor(.blue)
                        VStack(alignment: .leading) {
                            Text(String(user.totalKarma))
                                .font(.title2)
                            Text("Karma")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    Spacer()
                    Divider()
                    Spacer()
                    Group {
                        Image(systemName: "calendar")
                            .foregroundColor(.blue)
                        VStack(alignment: .leading) {
                            Text("1 y")
                                .font(.title2)
                            Text("Reddit age")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                Divider()
                List {
                    ForEach(0..<15) { _ in
                        Text("Placeholder...")
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
            } else {
                ProgressView()
            }
        }
    }
}

struct SideMenuViewAuthed_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuViewAuthed(user: .constant(User.testUser))
    }
}
