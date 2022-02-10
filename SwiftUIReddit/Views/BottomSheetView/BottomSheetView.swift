//
//  BottomSheetView.swift
//  SwiftUIReddit
//
//  Created by Andrew Carter on 2/10/22.
//

import SwiftUI

struct BottomSheetView<Content: View>: View {
    
    @Binding var isPresented: Bool
    @State var overlayAlpha: Double = 0.0
    let content: Content
    
    var body: some View {
        Group {
            ZStack(alignment: .bottom) {
                if isPresented {
                    Rectangle().fill(.black.opacity(0.5))
                        .onTapGesture {
                            withAnimation {
                                isPresented = false
                            }
                        }
                }
            }
            .zIndex(1)
            .edgesIgnoringSafeArea(.all)
            VStack {
                if isPresented {
                    Spacer()
                    content
                        .padding()
                        .transition(.move(edge: .bottom))
                }
            }
            .zIndex(2)
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            BottomSheetView(isPresented: .constant(true), content: Text("test"))
        }
    }
    
}
