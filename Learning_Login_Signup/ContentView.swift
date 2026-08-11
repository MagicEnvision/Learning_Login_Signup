//
//  ContentView.swift
//  Learning_Login_Signup
//
//  Created by magic on 2026-08-10.
//

import SwiftUI

struct ContentView: View {
    // 1. Changed to @State so the property can be mutated by the user input
      @State private var text = ""
      
    var body: some View {
        VStack {
            // 2. Added '$' to pass a two-way binding to the TextField
            TextField("Email", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            // 3. Moved print logic into a Text view to safely render it inside the layout
            Text("Typed value: \(text)")
        }
    }
}

#Preview {
    ContentView()
}
