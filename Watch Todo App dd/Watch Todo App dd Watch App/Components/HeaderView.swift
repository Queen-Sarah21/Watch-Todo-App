//
//  HeaderView.swift
//  Watch Todo App dd Watch App
//
//  Created by user269332 on 2/20/25.
//

import SwiftUI

struct HeaderView: View {
    var title: String = ""
    var body: some View {
        VStack {
            //title
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
            }
            
            //separator
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            }.foregroundStyle(.accent)
        }
    }
}

#Preview {
    HeaderView(title: "Credits")
}
