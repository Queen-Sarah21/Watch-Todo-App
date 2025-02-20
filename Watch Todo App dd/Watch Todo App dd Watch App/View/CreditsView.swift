//
//  CreditsView.swift
//  Watch Todo App dd Watch App
//
//  Created by user269332 on 2/20/25.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack(spacing: 3) {
            Image("sarah")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding()
                .layoutPriority(1)
            
            //Header Component
            HeaderView(title: "Credits")
            
            Text("Queen Sarah")
                .foregroundStyle(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .fontWeight(.light)
        }
    }
}

#Preview {
    CreditsView()
}
