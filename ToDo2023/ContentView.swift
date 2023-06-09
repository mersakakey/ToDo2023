//
//  ContentView.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2023/05/08.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
