//
//  ContentView.swift
//  Memorize
//~
//  Created by Mehmet Ali Ertorer on 7.02.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}

struct CardView: View {
    var content: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.white)
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(lineWidth: 2)
            Text(content)
                .font(.largeTitle)
        }
    }
}


#Preview {
    ContentView()
}
